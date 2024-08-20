;;; config-scratch.el --- Put a silly image in the buffer -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; first, make the image
(use-package cowsay
  :straight t
  :init
  (cowsay-load-cow-file (expand-file-name "tux.cow" user-emacs-directory)))

;; wrap the cow in comments
(defun personal/prefix-comment (arg)
  "Comment ARG with semicolons."
  (interactive)
  (mapconcat
   (lambda (x) (concat ";; " x))
   (split-string arg "\n" t) "\n"))

;; now actually set our scratch buffer
(setq inhibit-startup-message t
      initial-scratch-message (concat (personal/prefix-comment  (cowsay-string "Emacs has finished starting." "tux")) "\n\n"))

;; redefine the annoying GNU advertisement
(defun display-startup-echo-area-message ()
  "Gets rid of that annoying GNU advertisement."
       (message "[init.el] Init complete. Get out there!"))

(provide 'config-scratch)
;;; config-scratch.el ends here
