;;; code-snippet.el --- YASnippet setup -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; first, install yasnippet
(use-package yasnippet
  :straight t
  :after yasnippet-snippets
  :diminish yas-global-mode
  :init
  (require 'yasnippet)
  (yas-global-mode 1))

;; then go grab some snippets for many languages
(use-package yasnippet-snippets
  :straight t)

;; some more language-specific ones
(use-package common-lisp-snippets
  :straight t
  :config
  (require 'common-lisp-snippets))

(use-package yasnippet-go
  :straight (:host github :repo "dominikh/yasnippet-go")
  :config)

(provide 'code-snippet)
;;; code-snippet.el ends here
