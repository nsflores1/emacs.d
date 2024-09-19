;;; lang-commonlisp.el --- Tools for editing Common Lisp -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; slime is bad, use sly instead
(use-package sly
  :straight t
  :ensure-system-package sbcl
  :diminish sly-mode
  :config
  (setq sly-protocol-version 'ignore
        sly-net-coding-system 'utf-8-unix))

;; add ansi color
(use-package sly-repl-ansi-color
  :straight t
  :after sly
  :config
  (push 'sly-repl-ansi-color sly-contribs))

;; be able to use common lisp's build system
(use-package sly-asdf
  :straight t
  :after sly
  :config
  (push 'sly-asdf sly-contribs))

(provide 'lang-commonlisp)
;;; lang-commonlisp.el ends here
