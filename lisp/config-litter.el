;;; config-litter.el --- Taking out the trash -*- lexical-binding: t -*-
;;; Commentary:
;; The goal of this section is to remove all non-required Emacs files
;; into a special folder, where they can be easily removed.
;;; Code:

;; change default settings on backups and deletion
(setq delete-old-versions t
      make-backup-files t
      kept-new-versions 9
      kept-old-versions 6
      ;; auto-save-timeout 20
      ;; auto-save-interval 200
      auto-save-default nil
      delete-auto-save-files t
      delete-by-moving-to-trash t
      vc-make-backup-files t
      version-control t
      backup-by-copying t)

;; use no-littering to control most files
(use-package no-littering
  :straight t
  :demand t
  :config
  (setq no-littering-etc-directory
        (expand-file-name "config/" user-emacs-directory))
  (setq no-littering-var-directory
        (expand-file-name "data/" user-emacs-directory))
  (no-littering-theme-backups)
  (progn
    (require 'recentf)
    (add-to-list 'recentf-exclude
                 (recentf-expand-file-name no-littering-var-directory))
    (add-to-list 'recentf-exclude
                 (recentf-expand-file-name no-littering-etc-directory)))
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
  (when (and (fboundp 'startup-redirect-eln-cache) (native-comp-available-p))
    (startup-redirect-eln-cache
     (convert-standard-filename
      (expand-file-name  "var/eln-cache/" user-emacs-directory)))))

(provide 'config-litter)
;;; config-litter.el ends here
