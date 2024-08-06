;;; config-misc.el --- Things that don't go elsewhere -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; unrelated settings
(fset 'yes-or-no-p 'y-or-n-p)
;; doesn't work in older emacs
;;(when (boundp 'use-short-answers)
;;  (setopt use-short-answers t))

;; force compliation to look nicer
(add-hook 'complilation-mode-hook 'visual-line-mode)

;; highlight urls
;; if we don't set it this way, xwidget breaks
(goto-address-prog-mode)

;; remember where we are
(save-place-mode 1)
(diminish save-place-mode)

;; run all of emacs faster
(use-package async
  :straight t
  :diminish dired-async mode async-bytecomp-package-mode
  :config
  (async-bytecomp-package-mode 1)
  (dired-async-mode 1))

;; respect editorconfig
(use-package editorconfig
  :straight t
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

;; use our shell variables
(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;; when Emacs starts outside the terminal, we don't get ssh-agent
;; TODO: ensure this is configured correctly
(use-package keychain-environment
  :disabled t
  :straight t
  :config
  (keychain-refresh-environment))

;; on linux, let us edit with sudo
(use-package sudo-edit
  :if *is-a-linux*
  :straight t)

;; improved help menu
;; TODO: have this play nice with consult
(use-package helpful
  :disabled t
  :straight t
  :config
  ;; rebind helpful to replace default help
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h x") #'helpful-command))

;; update our status to Discord
;; note: if we don't have discord running it will yell at you.
;; so maybe turn this on manually instead?
(use-package elcord
  :straight t
  :config
  (setq elcord-display-buffer-details nil
        elcord-display-line-numbers nil
        elcord-use-major-mode-as-main-icon t
        elcord-idle-timer 150
        elcord-editor-icon "emacs_pen_icon"))

;; always use UTF-8
(prefer-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))

;; kill the buffer and file
(defun personal/delete-this-file-and-buffer ()
  "Delete the current file and kill its buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "Nothing is being edited right now!"))
  (when (y-or-n-p (format "Really delete '%s'? "
			  (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)
    (message "Buffer killed.")))

;; Rename the buffer and file
(defun personal/rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name)
      (message "Buffer renamed."))))

;; Simpify our life.
(defun personal/revert-to-two-windows ()
  "Delete all other windows and split it into two."
  (interactive)
  (delete-other-windows)
  (split-window-right))

;; deal with adding extensions for a mode.
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))

(provide 'config-misc)
;;; config-misc.el ends here
