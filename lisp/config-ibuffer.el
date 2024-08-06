;;; config-ibuffer.el --- Replacing the default buffer system -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; ibuffer should be the default
(global-set-key (kbd "C-x C-b") 'ibuffer)

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

(provide 'config-ibuffer)
;;; config-ibuffer.el ends here
