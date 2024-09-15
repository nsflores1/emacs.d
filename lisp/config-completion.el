;;; config-completion.el --- Do things in less keystrokes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; enable recursive minibuffers (minibuffer command in minibuffer)
(setq enable-recursive-minibuffers t)

;; improve default minibuffer completion, define some changes to it
(use-package vertico
  :straight t
  :diminish vertico-mode
  :config
  ;; resize the minibuffer when moved
  (defun vertico-resize--minibuffer ()
    (add-hook 'window-size-change-functions
              (lambda (win)
                (let ((height (window-height win)))
                  (when (/= (1- height) vertico-count)
                    (setq-local vertico-count (1- height))
                    (vertico--exhibit))))
              t t))
  (advice-add #'vertico--setup :before #'vertico-resize--minibuffer)
  ;; show an arrow next to the current candidate
  (defvar +vertico-current-arrow t)
  (cl-defmethod vertico--format-candidate :around
    (cand prefix suffix index start &context ((and +vertico-current-arrow
                                                   (not (bound-and-true-p vertico-flat-mode)))
                                              (eql t)))
    (setq cand (cl-call-next-method cand prefix suffix index start))
    (if (bound-and-true-p vertico-grid-mode)
        (if (= vertico--index index)
            (concat #("▶" 0 1 (face vertico-current)) cand)
          (concat #("_" 0 1 (display " ")) cand))
      (if (= vertico--index index)
          (concat
           #(" " 0 1 (display (left-fringe right-triangle vertico-current)))
           cand)
        cand)))
  :hook (after-init . vertico-mode))

;; TODO: read purcell's version and expand upon this
(use-package marginalia
  :straight t
  :diminish marginalia-mode
  :hook (after-init . marginalia-mode))

;; enable orderless completion
(use-package orderless
  :straight t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; better replacement for isearch
(use-package ctrlf
  :straight t
  :hook (after-init . (lambda ()
                        (ctrlf-mode +1))))

;; remember our completions between sessions
(use-package prescient
  :straight t
  :config
  (prescient-persist-mode))

;; show number of matches in a search
(use-package anzu
  :straight t
  :diminish anzu-mode
  :hook (after-init . global-anzu-mode)
  :config
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

;; enable in-buffer completion, unlike that on the modeline
(use-package corfu
  :straight t
  :diminish corfu-mode corfu-popupinfo-mode
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  :bind (:map corfu-map ("RET" . nil))
  ;; if we use eshell, be careful not to autocomplete
  :hook (eshell-mode-hook . (lambda ()
                              (setq-local corfu-auto nil)
                              (corfu-mode)))
  :config
  ;; automatic completion!
  (setq corfu-auto t
        corfu-quit-no-match 'separator)
  ;; turn on corfu's plugins
  (corfu-history-mode 1))

;; we like corfu's miniframes, but they don't work on terminal
;; this extension lets you do something eles
(use-package corfu-terminal
  :straight t
  :if (string= (window-system) "nil")
  :after corfu
  :diminish corfu-terminal-mode
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))

;; wildly extend the range of shell options for completion
(use-package pcmpl-args
  :straight t
  :after corfu
  :config
  (require 'pcmpl-args))

;; TODO: look into cape at some point

;; make sure to show small icons next to corfu completions
(use-package kind-icon
  :straight t
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter)
  (setq kind-icon-use-icons nil
        kind-icon-blend-background t))

;; only use tabs with few candidates
(setq completion-cycle-threshold 3)

;; enable indentation and completion using the tab key, since M-TAB is usually bound
(setq tab-always-indent 'complete)

;; then add a completion mode for any time there's completing reads,
;; replace stock functions with this slowly.
(use-package consult
  :straight t
  :config
  ;; TODO: expland the list of things that would work
  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line)
  (global-set-key [remap yank] 'consult-yank-from-kill-ring)
  (global-set-key [remap yank-pop] 'consult-yank-pop))

;; if we're completing with grep, allow editing results
(use-package wgrep
  :straight t
  :config
  (require 'wgrep))

;; add general all-purpose history
;; this is needed because while completion menus remember frequency,
;; they're not very good at remembering what we were actually doing.
(use-package dogears
  :straight t)

;; TODO: check bookmark status, doesn't seem to work?
;; TODO: add binds for dogears?


(provide 'config-completion)
;;; config-completion.el ends here
