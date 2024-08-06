;;; lang-shell.el --- Code for manipulating shell features -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; add vterm support, if we're on a system that supports it
(use-package vterm
  :straight t
  :config
  (setq vterm-kill-buffer-on-exit t
        vterm-ignore-blink-cursor t))

;; actually, let's use vterm in eshell!
(use-package eshell-vterm
  :straight t
  :diminish eshell-vterm-mode
  :after eshell
  :config
  (eshell-vterm-mode))

;; sometimes using eshell is the correct choice.
;; make that less miserable
(use-package eshell-did-you-mean
  :straight t
  :after eshell
  :config
  (eshell-did-you-mean-setup))

(use-package eshell-fringe-status
  :straight t
  :after eshell
  :diminish eshell-fringe-status-mode
  :hook (eshell-mode . eshell-fringe-status-mode))

(use-package esh-autosuggest
  :straight t
  :after eshell
  :diminish eshell-autosuggest-mode
  :hook (eshell-mode . esh-autosuggest-mode))

(use-package eshell-syntax-highlighting
  :straight t
  :diminish eshell-syntax-highlighting-global-mode
  :after eshell
  :config
  (eshell-syntax-highlighting-global-mode +1))

;; make writing shell less evil
(setq sh-basic-offset 2
      sh-basic-indentation 2)

;; be able to read fish scripts
(use-package fish-mode
  :straight t)

(provide 'lang-shell)
;;; lang-shell.el ends here
