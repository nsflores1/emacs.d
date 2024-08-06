;;; lang-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; install this mode
(use-package markdown-mode
  :straight t
  ;; sometimes we use the github version
  :mode ("\\.md$" . gfm-mode)
  :hook (gfm-mode . visual-line-mode)
  :config
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'"))

;; when taking notes it's nice to use dice notation
(use-package decide-mode
  :straight (:host github :repo "lifelike/decide-mode"))

;; try this package too
(use-package emacs-rpgtk
  :straight (:host codeberg :repo "howardabrams/emacs-rpgtk"))
 
(provide 'lang-markdown)
;;; lang-markdown.el ends here
