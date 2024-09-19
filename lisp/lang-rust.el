;;; lang-rust.el --- The Rust programming language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; basic rust mode
(use-package rust-mode
  :straight t
  :mode "\\.rs\\'"
  :custom
  (rust-format-on-save t)
  (lsp-rust-server 'rust-analyzer))

;; TODO: add rustic-mode because why not

;; TODO: add cargo-mode

;; get better support for flycheck
(use-package flycheck-rust
  :straight t
  :ensure-system-package rust-analyzer
  :after rust-mode
  :hook (flycheck-mode . flycheck-rust-setup))

(provide 'lang-rust)
;;; lang-rust.el ends here
