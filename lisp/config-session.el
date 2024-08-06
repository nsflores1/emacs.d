;;; config-session.el --- Remember things -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; config-session.el

;; save history and open files in emacs directory
(setq-default history-length 1000)
(add-hook 'after-init-hook 'savehist-mode
	  'after-init-hook 'save-place-mode)
(setq save-place-forget-unreadable-files nil)
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600
      desktop-save t)

;; list what to save to it
(setq desktop-globals-to-save
      '((file-name-history . 100)
	(shell-command-history . 50)))
;; TODO: improve that

;; save history
(add-hook 'after-init-hook 'savehist-mode)
(diminish savehist-mode)

(provide 'config-session)
;;; config-session.el ends here
