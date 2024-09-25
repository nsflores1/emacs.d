;;; config-editor.el --- Basic Emacs settings -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; bind a key for inserting a unicode character
;; note: common prefix for custom commands is left to be defined
;;(bind-key "C-c")

;; set up electric pair mode
(when (fboundp 'electric-pair-mode)
  (add-hook 'after-init-hook 'electric-pair-mode))
(add-hook 'after-init-hook 'electric-indent-mode)

;; also use hl-line mode
(when (fboundp 'hl-line-mode)
  (add-hook 'after-init-hook 'hl-line-mode))
(add-hook 'after-init-hook 'hl-line-mode)

;; unacceptable base scrolling behavior
(use-package smooth-scrolling
  :straight t
  :diminish smooth-scrolling-mode
  :hook (after-init . (lambda
                        () (smooth-scrolling-mode 1))))

;; make all our parens gloriously rainbow colored
(use-package rainbow-delimiters
  :straight t
  :diminish rainbow-delimiters-mode
  :hook (prog-mode . rainbow-delimiters-mode))

;; color indented regions on command
(use-package prism
  :straight (:host github :repo "alphapapa/prism.el"))

;; make colors match their amounts
(use-package rainbow-mode
  :straight t
  :diminish rainbow-mode
  :hook ((emacs-lisp-mode . rainbow-mode)
         (help-mode . rainbow-mode)
         ((css-mode html-mode sass-mode) . rainbow-mode)))

;; show escape sequences
(use-package highlight-escape-sequences
  :straight t
  :diminish hes-mode
  :hook (after-init . hes-mode))

;; highlight numerical literals in source
(use-package highlight-numbers
  :straight t
  :diminish highlight-numbers-mode
  :hook (prog-mode . highlight-numbers-mode))

;; highlight the thing we're idling on, if anything
(use-package idle-highlight-mode
  :straight t
  :diminish idle-highlight-mode
  :config (setq idle-highlight-idle-time 0.6)
  :hook ((prog-mode text-mode) . idle-highlight-mode))

;; highlight the current top level form
(use-package topsy
  :straight t
  :disabled t
  :hook ((prog-mode . topsy-mode)
         (magit-section-mode . topsy-mode)))
;; TODO: this *really* needs to be specified by major mode.

;; highlight all links on screen
;; TODO: reconsider this
(use-package link-hint
  :straight t
  :disabled t)

;; show page breaks
(use-package page-break-lines
  :straight t
  :diminish page-break-lines-mode
  :hook (after-init . global-page-break-lines-mode))

;; remind us of our binds
(use-package which-key
  :straight t
  :diminish which-key-mode
  :hook (after-init . which-key-mode))

;; allow indirect, or subedits
;; like org-code-src but arbitrary
(use-package edit-indirect
  :straight t)

;; if no region is selected, assume current line
(use-package whole-line-or-region
  :straight t
  :diminish whole-line-or-region-local-mode
  :hook (after-init . whole-line-or-region-global-mode))

;; handle the entire undo tree
;; TODO: stop littering on disk!!!
(use-package undo-tree
  :straight t
  :disabled t
  :diminish undo-tree-mode
  :config
;;  (setq undo-tree-history-directory-alist (default-directory . (expand-file-name "backups")))
  (global-undo-tree-mode))

;; change the names of our buffers if there's two of the same name
;; this is useful for projects with repeating structures
(use-package buffer-name-relative
  :straight t
  :diminish buffer-name-relative-mode
  :config
  (buffer-name-relative-mode))

;; when we have two files of the same name, treat them differently
(require 'uniquify)
(setq uniquify-separator " • "
      uniquify-after-kill-buffer-p t
      uniquify-ignore-buffers-re "^\\*"
      uniquify-buffer-name-style 'reverse)

;; display line numbers mode when needed
(when (fboundp 'display-line-numbers-mode)
  (setq-default display-line-numbers-width 3)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

;; handle long files
(when (fboundp 'so-long-enable)
  (add-hook 'after-init-hook 'so-long-enable))

;; when we're a mac, use mdfind not find
(when *is-a-mac*
  (setq-default locate-command "mdfind"))

;; some basic preferences
(setq-default blink-cursor-interval 0.4
	      column-number-mode t
	      indent-tabs-mode nil
	      create-lockfiles nil
	      mouse-yank-at-point t
	      truncate-lines nil
              scroll-preserve-screen-position 'always
	      truncate-partial-width-windows nil
	      column-number-mode t
	      buffers-menu-max-size 30)

(add-hook 'after-init-hook 'delete-selection-mode
	  'after-init-hook 'global-auto-revert-mode)

(provide 'config-editor)
;;; config-editor.el ends here
