;;; config-theme.el --- Settings for themes -*- lexical-binding: t -*-
;;; Commentary:
;; These packages are always demanded because themes are never required.
;; So if we want them to be there on load, we have to force this.
;;; Code:

;; don't ask us if custom themes are safe
(setq custom-safe-themes t)

;; good theme packages
(use-package solarized-theme
  :straight t
  :demand t
  :config
  (setq solarized-high-contrast-mode-line nil
        solarized-distinct-doc-face t
        solarized-distinct-fringe-background t
        solarized-emphasize-indicators t
        x-underline-at-descent-line t))
;; good terminal theme
(use-package waher-theme
  :straight t)
(use-package acme-theme
  :straight t)
(use-package goose-theme
  :straight t)

;; auto-dark
;; TODO: use the package for setting per-buffer themes for this
;; ideally, we want a helper application that would check
;; which frames exist, what buffers are in them, and then set
;; the per-buffer theme for each accordingly.

;; ALSO TODO:
;; get this to run in dark mode:
;; (add-to-list 'default-frame-alist '(alpha-background . 70))
(use-package auto-dark
  :straight t
  :diminish auto-dark-mode
  :demand t
  :init
  (auto-dark-mode t)
  ;; TODO: figure out why this won't work
  ;; (add-hook 'auto-dark-dark-mode-hook
  ;;           #'(lambda ()
  ;;             (set-frame-parameter nil 'alpha-background 70)))
  ;; (add-hook 'auto-dark-light-mode-hook
  ;;           #'(lambda ()
  ;;             (set-frame-parameter nil 'alpha-background 100)))
  :custom
  (auto-dark-allow-osascript t)
  (auto-dark-light-theme 'solarized-selenized-white)
  (auto-dark-dark-theme 'solarized-selenized-black))

;; ;; the theme for terminals should be dark always
(use-package color-theme-buffer-local
  :straight (:host github :repo "vt5491/color-theme-buffer-local")
  :after noflet
  :demand t)
(use-package noflet
  :straight t)
;; Needs serious work.

(provide 'config-theme)
;;; config-theme.el ends here
