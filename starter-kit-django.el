;;; starter-kit-django.el --- Some helpful Django code
;;
;; Part of the Emacs Starter Kit

;; Enable django-nxhtml-mumano-mode
(add-to-list 'auto-mode-alist '("\\.[sxd]?html$" . django-nxhtml-mumamo-mode))

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
;; FIX: Mode hooks
(add-hook 'html-mode-hook
          (lambda ()
            (local-set-key "\C-c\C-t" 'django-html-insert-translation)
            (setq indent-tabs-mode nil)
            ))

;; Load Django (Python) mode
(require 'django-python-mode)

(provide 'starter-kit-django)
;; starter-kit-django.el ends here
