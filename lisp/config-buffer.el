;;; config-buffer.el --- Replacing the default buffer system -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ibuffer should be the default,
;; unless we can use bufler
;;(global-set-key (kbd "C-x C-b") 'ibuffer)

;; train ibuffer to recognize git repositories and look less ugly
(use-package ibuffer-vc
  :straight t
  :after ibuffer
  :hook (ibuffer . (lambda ()
                     (ibuffer-vc-set-filter-groups-by-vc-root)
                     ;; better ibuffer sort
                     (unless (eq ibuffer-sorting-mode 'filename/process)
                       (ibuffer-do-sort-by-filename/process)))))

;; don't show empty groups, make it nicer
(setq-default ibuffer-show-empty-filter-groups nil
              ibuffer-filter-group-name-face 'font-lock-doc-face)

;; use bufler instead
(use-package bufler
  :straight (:host github :repo "alphapapa/bufler.el")
  ;; because prism is used to filter
  :bind ("C-x C-b" . bufler)
  :config
  (setq bufler-use-cache t
        bufler-vc-state t
        bufler-face-prefix 1))

(provide 'config-buffer)
;;; config-buffer.el ends here
