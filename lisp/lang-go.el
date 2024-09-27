;;; lang-go.el --- Duct tape to run Golang -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package go-mode
  :straight t
  :config
  (add-hook 'before-save-hook 'gofmt-before-save)
  :init
  ;; fix annoying issues with GOPATH
  (setenv "GOPATH" (concat (getenv "HOME") ".go")))

;; eldoc in modeline
(use-package go-eldoc
  :straight t
  :disabled t
  :after go-mode
  :hook (go-mode . 'go-eldoc-setup))

;; go lang playground
(use-package go-playground
  :straight t)

(provide 'lang-go)
;;; lang-go.el ends here
