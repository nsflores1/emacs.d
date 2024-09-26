;;; early-init.el --- In the beginning there was early-init -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; disable slow features, but restore them after init
;; todo: see if a package doesn't handle this better,
;; this is a very clunky solution
(let ((init-file-name-handler-alist file-name-handler-alist))
  (setq gc-cons-threshold most-positive-fixnum
        file-name-handler-alist nil)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold (* 128 1024 1024)
                        file-name-handler-alist init-file-name-handler-alist))))

;; tune performance permanently
(setq jit-lock-defer-time 0
      read-process-output-max (* 4 1024 1024)
      process-adaptive-read-buffering nil)

;; Turn off packages
(setq package-enable-at-startup nil)

;; always save all our output for debugging sake
(setq message-log-max t)

;; don't check mtime on elisp bytecode
(setq load-prefer-newer noninteractive)

;; enable high levels of recursion
;; not too high or we'll stack overflow!
(setq max-lisp-eval-depth 2000)

;; simpler way of seeing our OS
(defconst *is-a-mac* (eq system-type 'darwin)
  "System is running macOS.")
(defconst *is-a-windows* (eq system-type 'windows-nt)
  "System is running Microsoft Windows.")
(defconst *is-a-linux* (eq system-type 'gnu/linux)
  "System is running Linux.")
(defconst *is-a-haiku* (eq system-type 'haiku)
  "System is running Haiku.")
(defconst *is-a-unix* (or (eq system-type 'aix)
                          (eq system-type 'berkeley-unix)
                          (eq system-type 'cygwin)
                          (eq system-type 'gnu))
  "System is running some non-Linux Unix.")

;; Install straight.el, if possible
;; this will error if git isn't detected
(if (not (or *is-a-windows* (not (executable-find "git"))))
    (progn (defvar bootstrap-version)
           (let ((bootstrap-file
                  (expand-file-name
                   "straight/repos/straight.el/bootstrap.el"
                   (or (bound-and-true-p straight-base-dir)
                       user-emacs-directory)))
                 (bootstrap-version 7))
             (unless (file-exists-p bootstrap-file)
               (with-current-buffer
                   (url-retrieve-synchronously
                    "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
                    'silent 'inhibit-cookies)
                 (goto-char (point-max))
                 (eval-print-last-sexp)))
             (load bootstrap-file nil 'nomessage)))
  (error "[init.el] git not detected, init is impossible"))

;; it's a good idea to get the current frame now, so we can use it again
;; at a later time, and easily check how the session started.
(defconst personal/*initial-frame* (selected-frame)
  "The frame (if any) created at Emacs initialization.")

;; editing windows is expensive, but there's no frames yet,
;; so now is the ideal time to edit our frame.
(setq window-resize-pixelwise t
      frame-resize-pixelwise t
      frame-title-format '((:eval (if (buffer-file-name)
				      (abbreviate-file-name (buffer-file-name))
				    "%b"))))
(if *is-a-mac*
    (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))

(message "[init.el] graphical frames resized, if they exist")

;; we've succeeded!
(message "[init.el] early-init.el loaded, straight.el installed")
;;; early-init.el ends here
