;;; code-syntax.el --- Flycheck, eglot and its friends -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; install flycheck, but be aware that you need external tools too!
(use-package flycheck
  :straight t
  :hook (after-init . global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers
                '(rust go-build go-vet)))

;; set up eglot
(use-package eglot
  :straight t
  ;; TODO: make some generic that checks if the executable exists, then
  ;; add this to the hook.
  :hook ((rust-mode . eglot-ensure)
         (LaTeX-mode . eglot-ensure)
         (common-lisp-mode . eglot-ensure)
         (go-mode . eglot-ensure)))

;; we need extra completions for consult with eglot
(use-package consult-eglot
  :straight t
  :after eglot)

;; then also set up flycheck to work with eglot
(use-package flycheck-eglot
  :straight t
  :after (flycheck eglot)
  :diminish flycheck-eglot-mode
  :config
  (global-flycheck-eglot-mode 1))

;; so when we save it, autoformat and make it nicer
(use-package apheleia
  :straight t
  :diminish apheleia-global-mode
  :config
  (apheleia-global-mode +1))

;; todo: look into puni for manipulating code syntax

(provide 'code-syntax)
;;; code-syntax.el ends here
