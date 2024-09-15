;;; config-dired.el --- Dired and other file managers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; allow for directory comparison
(use-package ztree
  :straight t)

;; use treemacs
(use-package treemacs
  :straight t
  :custom
  (setq treemacs-no-png-images t))

(provide 'config-dired)
;;; config-dired.el ends here
