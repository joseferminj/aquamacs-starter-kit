;;; starter-kit-django.el --- Some helpful Django code
;;
;; Part of the Emacs Starter Kit

;; Enable django-html-mumano-mode
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode))

(setq mumamo-chunk-coloring nil)
(setq mumamo-background-colors nil)

;; Functions
(defun django-html-insert-translation (from to &optional buffer)
  (interactive "*r")
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (iso-iso2sgml from to)
      (insert "{% trans \"")
      (goto-char (point-max))
      (insert "\" %}")
      (point-max))))

;; Hooks
(dolist (mode '(django-html-mumamo-mode-hook)) 
  (add-hook mode
            (lambda ()
              (local-set-key "\C-c\C-t" 'django-html-insert-translation)
              (setq indent-tabs-mode nil)
              )
            )
  )

(provide 'starter-kit-django)
;; starter-kit-django.el ends here
