;;; init.el --- And there was the Config, and it was good -*- lexical-binding: t -*-
;;; Commentary:
;;; The settings for literally everything is here.  Changing everything should be in this menu.
;;; Code:

;; run a message
(message "[init.el] Emacs is starting up, init.el now being read")

;; early-init MUST be loaded and may not have been if Emacs
;; is a version older than 27.1
(when (version< emacs-version "27.1")
  (error "[init.el] Your Emacs is outdated; this config requires 27.1 or higher to run"))

;; set where our stuff is
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(setq custom-file (locate-user-emacs-file "custom.el"))

;; use newest byte code
(setq load-prefer-newer t)

;; okay now run all our stuff
(require 'config-straight)
(require 'config-litter)
(require 'config-misc)

;; TODO: much of this requires external utilities. it should check
;; if said things are actually installed on system during init

(require 'config-theme)
(require 'config-window)
(require 'config-graphics)

(require 'config-editor)
(require 'config-session)
(require 'config-completion)
(require 'config-buffer)
(require 'config-dired)
(require 'config-spelling)

(require 'code-syntax)
(require 'code-git)
(require 'code-snippet)
(require 'code-compile)

(require 'lang-elisp)
(require 'lang-commonlisp)
(require 'lang-shell)
(require 'lang-latex)
(require 'lang-markdown)
(require 'lang-rust)
(require 'lang-python)
(require 'lang-config)
(require 'lang-matlab)
(require 'lang-go)

;; TODO: add a Haskell mode maybe? improve rust-mode
;; also, set up a mode for web code editing (css, html)
;; would be nice to have something nice for project management too.

;; TODO: add something to deal with managing state (open buffers)
;; across emacs restarts.

;; TODO: add a R and Stata mode

;; TODO: consider rewriting the entire config in org-mode

;; put a silly image in our scratch buffer
(require 'config-scratch)

;; run emacsclient, but only on unix
(if (not (or *is-a-windows* *is-a-haiku*))
    (add-hook 'after-init-hook
	      (lambda ()
	        (require 'server)
	        (unless (server-running-p)
	          (server-start)))))

;; announce we are all good
(message "[init.el] Emacs has finished starting up, init.el processed")
;;; init.el ends here
