;; django-python-mode.el - Major mode for Django web framework.
;; Copyright 2010 MyFreeWeb
;; Copyright 2010 www.justanothercodemonkey.com
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;   http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing,
;;   software distributed under the License is distributed on an "AS
;;   IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
;;   express or implied.  See the License for the specific language
;;   governing permissions and limitations under the License.

(require 'python-mode)

(define-derived-mode django-python-mode python-mode "Django Python Mode" "Major mode for Django web framework.")
(add-hook 'django-python-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(django\\|models\\|request\\)" 1 font-lock-type-face)
                                      ("\\<\\(get_list_or_404\\|get_object_or_404\\|redirect\\|render_to_response\\)" . font-lock-builtin-face))
                    ))
          )

;; autoloads
(add-to-list 'auto-mode-alist '("\\<admin.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<context_processors.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<fields.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<handlers.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<models.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<settings.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<signals.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<tests.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<urls.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<views.py" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<widgets.py" . django-python-mode))

;; functions
(defun django-python-insert-translation (from to &optional buffer)
  (interactive "*r")
  (save-excursion
    (save-restriction
      (narrow-to-region from to)
      (goto-char from)
      (iso-iso2sgml from to)
      (insert "_(")
      (goto-char (point-max))
      (insert ")")
      (point-max))))

(add-hook 'django-python-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-t" 'django-python-insert-translation)
             ))

(provide 'django-python-mode)
;; django-python-mode.el ends here
