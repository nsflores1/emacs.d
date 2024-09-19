;;; lang-python.el --- Configuration for Python -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; this should be the default
(setq python-shell-interpreter "python3")

;; remind us what the pip standard is
(use-package pip-requirements
  :straight t)

;; format python correctly
(use-package blacken
  :straight t
  :ensure-system-package black
  :diminish blacken-mode
  :hook ((python-mode . blacken-mode)))

(provide 'lang-python)
;;; lang-python.el ends here
