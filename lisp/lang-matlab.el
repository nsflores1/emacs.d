;;; lang-matlab.el --- MATLAB editor mode -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; install matlab
(use-package matlab-mode
  :straight (:host github :repo "mathworks/Emacs-MATLAB-Mode"))

;; TODO: Matlab expects us to run Emacs in client mode,
;; but this doesn't work on the Mac port and old Emacs versions.
;; How to get around this?

(provide 'lang-matlab)
;;; lang-matlab.el ends here
