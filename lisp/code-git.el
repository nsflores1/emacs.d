;;; code-git.el --- Settings for Git -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; travel through history in git
(use-package git-timemachine
  :straight t)

;; show us where things are new and uncomitted
;; note: this will conflict with flycheck
;; it also doesn't work in the terminal
(use-package diff-hl
  :straight t
  :if window-system
  :hook (after-init . global-diff-hl-mode)
  :config
  :diminish global-diff-hl-mode
  :custom
  (diff-hl-disable-on-remote t)
  (diff-hl-margin-symbols-alist
   '((insert . " ")
     (delete . " ")
     (change . " ")
     (unknown . "?")
     (ignored . "i"))))

;; use magit
;; TODO: set everything correctly
(use-package magit
  :straight t)

;; add todos to magit
(use-package magit-todos
  :straight t
  :after magit
  :diminish magit-todos-mode
  :init
  (magit-todos-mode 1))

;; add git's undos to the emacs undo feature
;; requires being manually invoked sadly
(use-package git-undo
  :straight t)

(provide 'code-git)
;;; code-git.el ends here
