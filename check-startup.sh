#!/bin/sh -e
echo "Attempting startup..."
${EMACS:=emacs} -nw --batch \
                --eval '(progn
                         (let ((debug-on-error t)
                               (user-emacs-directory default-directory)
                               (user-init-file (expand-file-name user-emacs-directory "init.el"))
                               (load-path (delq default-directory load-path)))
                        (load-file "early-init.el")
                        (load-file user-init-file)
                        (run-hooks (quote after-init-hook))))'
if [[ $? == 0 ]]; then
  echo "Startup successful"
else
  echo "Something has gone wrong, startup failure"
fi
