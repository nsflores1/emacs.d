;;; config-window.el --- For managing frames within Emacs -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; make it easier to move
(use-package switch-window
  :straight t
  :custom
  (switch-window-shortcut-style 'alphabet)
  (switch-window-timeout nil)
  :bind
  ("C-x o" . switch-window))

(provide 'config-window)
;;; config-window.el ends here
