;;; lang-shell.el --- Code for manipulating shell features -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; add vterm support, if we're on a system that supports it
(use-package vterm
  :straight t
  :if (or *is-a-linux* *is-a-mac*)
  :config
  (setq vterm-kill-buffer-on-exit t
        vterm-ignore-blink-cursor t))

;; actually, in case vterm doesn't work,
;; let's add another terminal emulator
;; TODO: evaluate this vs vterm
(use-package eat
  :straight (:host codeberg :repo "akib/emacs-eat")
  :diminish eat-eshell-mode eat-eshell-visual-command-mode
  :custom (eat-terminal-name "xterm")
  :config
  (eat-eshell-mode)
  (eat-eshell-visual-command-mode))

;; actually, let's use vterm in eshell!
(use-package eshell-vterm
  :straight t
  :if (or *is-a-linux* *is-a-mac*)
  :diminish eshell-vterm-mode
  :after eshell
  :config
  (eshell-vterm-mode))

;; sometimes using eshell is the correct choice.
;; make that less miserable
(use-package eshell-did-you-mean
  :straight t
  :if (or *is-a-linux* *is-a-mac*)
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

;; eshell can use fish scripts
(use-package fish-completion
  :straight t
  :after eshell
  :diminish global-fish-completion-mode
  :if (and (executable-find "fish") (or *is-a-linux* *is-a-mac*))
  :config
  (global-fish-completion-mode))

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
