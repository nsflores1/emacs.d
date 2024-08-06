;;; lang-config.el --- Emacs support for all the configs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; add support for crontab (useful for Unix)
(use-package crontab-mode
  :straight t
  :mode "\\.crontab\\'")

;; systemd (Linux only)
(use-package systemd
  :straight t
  :mode "\\.unit\\.service\\'")

;; journald log files (Linux only)
(use-package journalctl-mode
  :straight t)

;; .ini files (pretty universal)
(use-package ini-mode
  :straight t
  :mode "\\.ini\\'")

;; edit fvwm files (mostly for OpenBSD)
(use-package fvwm-mode
  :straight t
  :mode "\\.fvwm\\'")

;; tmux (useful for Unix)
(use-package tmux-mode
  :straight t
  :mode "\\.tmux.conf\\'")

;; vimrc, hopefully this will never be needed
(use-package vimrc-mode
  :straight t
  :mode "\\.vimrc\\.virc\\'")

;; edit git's config files
(use-package git-modes
  :straight t
  :mode "\\.gitconfig\\'")

;; edit data in yaml
(use-package yaml-mode
  :straight t
  :mode "\\.yml\\.erb\\'")

;; edit data in dhall
(use-package dhall-mode
  :straight t
  :mode "\\.dhall\\'")

;; edit csv files
(use-package csv-mode
  :straight t
  :mode "\\.[Cc][Ss][Vv]\\'"
  :config
  (setq csv-separators '("," ";" "|" " ")))

;; appears too commonly not to have
(use-package json-mode
  :straight t
  :mode "\\.json\\'")

;; practical everywhere
(use-package dotenv-mode
  :straight t
  :mode "\\.env\\'")

;; phpBB posts (kind of an oddball but occasionally shows up)
(use-package bbcode-mode
  :straight t)

(provide 'lang-config)
;;; lang-config.el ends here
