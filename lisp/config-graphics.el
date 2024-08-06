;;; config-graphics.el --- Improve frames' appearance -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; turn off all the junk visually
(tool-bar-mode -1)
(scroll-bar-mode -1)
(pixel-scroll-mode)
(setq use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t)

;; enable the right click option
(context-menu-mode)

;; highlight the current line when we're within a graphical frame
(when window-system (add-hook 'prog-mode-hook 'hl-line-mode))

;; dim buffers so that active buffer is obvious
(use-package dimmer
  :straight t
  :if window-system
  :diminish dimmer-mode
  :config
  (require 'dimmer)
  (dimmer-configure-which-key)
  (dimmer-configure-helm)
  (dimmer-mode t))

;; add a beacon when we move into a new buffer
(use-package beacon
  :straight t
  :if window-system
  :diminish beacon-mode
  :config
  (beacon-mode 1))

;; flash the text that we're looking at when editing
(use-package goggles
  :straight t
  :if window-system
  :diminish goggles-mode
  :hook ((prog-mode text-mode) . goggles-mode)
  :config
  (setq-default goggles-pulse t))

;; blink and fade the cursor so it never fully goes away
;; todo: this doesn't seem to work anymore
 (use-package pulsing-cursor
   :straight (:host github :repo "jasonjckn/pulsing-cursor")
   :if window-system
   :diminish pulsing-cursor-mode
   :config
   (pulsing-cursor-mode +1))

;; make the symbols look nicer, when we have Unicode
(use-package pretty-symbols
  :straight t
  :if window-system
  :diminish pretty-symbols-mode
  :hook (prog-mode . pretty-symbols-mode))

;; show us the end of the indentation lines
(use-package highlight-indent-guides
  ;; the original package has a bug with background colors,
  ;; this fork fixes it.
  :straight (:host github :repo "Dickby/highlight-indent-guides")
  :if window-system
  :diminish highlight-indent-guides-mode
  :hook (prog-mode . highlight-indent-guides-mode)
  :config
  (setq highlight-indent-guides-method 'bitmap))

;; display system status in the minibuffer when we're graphical
;; note: this package is currently broken, try and fix it
(use-package symon
  :disabled t
  :straight (:host github :repo "nsflores1/symon")
  :if window-system
  :config
  (require 'symon)
  (symon-mode))

;; provide a much nicer default mode line
;; TODO: make this look better
(use-package telephone-line
  :straight t
  :demand t
  :if window-system
  :diminish telephone-line-mode
  :config
  (setq telephone-line-lhs
        '((evil   . (telephone-line-erc-modified-channels-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-process-segment))
          (nil    . (telephone-line-projectile-segment
                     telephone-line-buffer-segment)))
        telephone-line-rhs
        '((nil    . (telephone-line-flycheck-segment
                     telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-position-segment)))
        telephone-line-height 20
        ;; different layouts don't render well on macOS.
        telephone-line-primary-left-separator 'telephone-line-nil
        telephone-line-secondary-left-separator 'telephone-line-nil
        telephone-line-primary-right-separator 'telephone-line-nil
        telephone-line-secondary-right-separator 'telephone-line-nil)
  (telephone-line-mode 1))

;; minor linux-specific things
(when *is-a-linux*
  (set-face-attribute 'default nil :height 98)
  (menu-bar-mode -1))

(provide 'config-graphics)
;;; config-graphics.el ends here
