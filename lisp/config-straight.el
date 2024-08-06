;;; config-straight.el --- Setup package repos -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; install straight-use-package
(straight-use-package 'use-package)

;; aggressively delay loading packages
(setq use-package-always-defer t)

;; benchmark our init time
(use-package benchmark-init
  :straight t
  :hook (after-init . benchmark-init/deactivate))

;; this make flycheck mad but it does work
(require 'benchmark-init)

;; our first move is to install diminish since it's used everywhere
(use-package diminish :straight t)

;; we should also extend use-package a bit
;; TODO: actually edit the things that *do* need this
(use-package use-package-ensure-system-package)

(provide 'config-straight)
;;; config-straight.el ends here
