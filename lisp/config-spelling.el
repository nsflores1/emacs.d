;;; config-spelling.el --- Enable Emacs spelling -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; basically required to really spellcheck
(require 'ispell)

;; the plan is to use this like everything else in flycheck
;; only really works on Linux and macOS
(use-package flycheck-aspell
  :straight t
  :when (executable-find "aspell")
  :config
  (setq ispell-program-name "aspell"
        ispell-silently-savep t)
  (require 'flycheck-aspell)
  (dolist (mode '('tex-aspell-dynamic
                  'markdown-aspell-dynamic
                  'html-aspell-dynamic
                  'xml-aspell-dynamic
                  'nroff-aspell-dynamic
                  'texinfo-aspell-dynamic
                  'c-aspell-dynamic))
    (add-to-list 'flycheck-checker mode)))

(provide 'config-spelling)
;;; config-spelling.el ends here
