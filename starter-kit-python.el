;;; 
(eval-after-load 'python-mode
  '(progn
     ;; Ropemacs Settings
     (setenv "PYTHONPATH"
             (concat
              (getenv "PYTHONPATH") ":"
              (concat dotfiles-dir "/elpa-to-submit/emacs-for-python")))

     (setq pymacs-load-path
           (list
            (concat dotfiles-dir "/elpa-to-submit/emacs-for-python/ropemacs")))

     ;; Pymacs
     (autoload 'pymacs-apply "pymacs")
     (autoload 'pymacs-call "pymacs")
     (autoload 'pymacs-eval "pymacs" nil t)
     (autoload 'pymacs-exec "pymacs" nil t)
     (autoload 'pymacs-load "pymacs" nil t)

     (pymacs-load "ropemacs" "rope-")

     ;; Stops from erroring if there's a syntax err
     (setq ropemacs-codeassist-maxfixes 3)
     (setq ropemacs-guess-project t)
     (setq ropemacs-enable-autoimport t)

     ;; Adding hook to automatically open a rope project if there is one
     ;; in the current or in the upper level directory
     (add-hook 'python-mode-hook
               (lambda ()
                 (cond ((file-exists-p ".ropeproject")
                        (rope-open-project default-directory))
                       ((file-exists-p "../.ropeproject")
                        (rope-open-project (concat default-directory "..")))
                       )))

     ;; Flymake for python configuration
     (when (require 'flymake)
       (defun flymake-pyflakes-init ()
         "Pyflakes flymake python file checking"
         (when (not (subsetp (list (current-buffer)) (tramp-list-remote-buffers)))
           (let* ((temp-file (flymake-init-create-temp-buffer-copy
                              'flymake-create-temp-inplace))
                  (local-file (file-relative-name
                               temp-file
                               (file-name-directory buffer-file-name))))
             (list "pyflakes" (list local-file)))))
       

       (add-to-list 'flymake-allowed-file-name-masks
                    '("\\.py\\'" flymake-pyflakes-init))
       (add-hook 'python-mode-hook 'flymake-find-file-hook)
       )

     (setq-default indent-tabs-mode nil)
     (setq-default tab-width 4)
     (setq-default py-indent-offset 4)
     )
  )

(add-hook 'python-mode-hook 'turn-on-eldoc-mode)

;; Cython Mode
(autoload 'cython-mode "cython-mode" "Mode for editing Cython source files")

(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

;; Other files for python mode
(add-to-list 'auto-mode-alist '("wscript" . python-mode))
(add-to-list 'auto-mode-alist '("SConscript" . python-mode))

(provide 'starter-kit-python)
