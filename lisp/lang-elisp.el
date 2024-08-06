;;; lang-elisp.el --- Settings for working on Elisp -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; stops flycheck from yelling at you
(defun personal/headerise-elisp ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n"))))

;; to ensure that we always have the newest possible form of our elisp code, compiled
(use-package auto-compile
  :straight t
  :diminish auto-compile-on-save-mode auto-compile-on-load-mode
  :hook ((after-init . auto-compile-on-save-mode)
         (after-init . auto-compile-on-load-mode)))

;; tell us where and when things are happening
(use-package highlight-quoted
  :straight t
  :diminish highlight-quoted-mode
  :hook (emacs-lisp-mode-hook . highlight-quoted-mode))

;; automatically format elisp code on save
(use-package elisp-autofmt
  :straight t
  :diminish elisp-autofmt-mode
  :hook (emacs-lisp-mode-hook . elisp-autofmt-mode))

;; need this for working on elisp projects
;; TODO: setup
(use-package cask-mode
  :straight t
  :disabled t)

(provide 'lang-elisp)
;;; lang-elisp.el ends here
