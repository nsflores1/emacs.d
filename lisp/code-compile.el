;;; code-compile.el --- Make M-x compile more useful -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; fix compilation colors so they can look okay
(use-package fancy-compilation
  :straight t
  :diminish fancy-compilation-modex
  :config
  (fancy-compilation-mode))

;; compile should scroll automatically
(setq-default compilation-scroll-output t)

;; TODO: setup multi-compile

(provide 'code-compile)
;;; code-compile.el ends here
