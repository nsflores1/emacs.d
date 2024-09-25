;;; lang-latex.el --- Settings for editing LaTeX -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; force us to use xelatex
(setq latex-run-command "xelatex")

;; AucTeX doesn't need many changes
(use-package auctex
  :straight t)

(use-package preview
  :after latex
  :disabled t)

;; a variety of completions for corfu
(use-package company-reftex
  :straight t
  :after corfu)

;; TODO: setup citation support
(use-package citar
  :straight t)

;; TODO: figure out how to make LaTeX editing not the worst thing ever

(provide 'lang-latex)
;;; lang-latex.el ends here
