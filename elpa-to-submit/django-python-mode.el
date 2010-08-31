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

;; Define new derived mode
(define-derived-mode django-python-mode python-mode "Python (Django) Mode" "Major mode for Django web framework.")

;; Font lock faces
(add-hook 'django-python-mode-hook
          (lambda ()
            (font-lock-add-keywords nil
                                    '(("\\<\\(django\\(\\.[a-z]+\\)\\{0,\\}\\>\\)" . font-lock-builtin-face)
                                      ("\\<\\(\\(meta\\|forms\\|models\\)\\.\\(Admin\\|AutoField\\|BooleanField\\|CharField\\|CommaSeparatedIntegerField\\|DateField\\|DateTimeField\\|DecimalField\\|EmailField\\|FileField\\|FilePathField\\|FloatField\\|ForeignKey\\|ImageField\\|IntegerField\\|IPAddressField\\|ManyToManyField\\|NullBooleanField\\|OneToOneField\\|PhoneNumberField\\|PositiveIntegerField\\|PositiveSmallIntegerField\\|SlugField\\|SmallIntegerField\\|TextField\\|TimeField\\|URLField\\|USStateField\\|XMLField\\)\\)" . font-lock-type-face)
                                      ("\\<\\(ABSOLUTE_URL_OVERRIDES\\|ADMIN_FOR\\|ADMIN_MEDIA_PREFIX\\|ADMINS\\|ALLOWED_INCLUDE_ROOTS\\|APPEND_SLASH\\|AUTHENTICATION_BACKENDS\\|AUTH_PROFILE_MODULE\\|CACHE_BACKEND\\|CACHE_MIDDLEWARE_KEY_PREFIX\\|CACHE_MIDDLEWARE_SECONDS\\|DATABASE_ENGINE\\|DATABASE_HOST\\|DATABASE_NAME\\|DATABASE_OPTIONS\\|DATABASE_PASSWORD\\|DATABASE_PORT\\|DATABASE_USER\\|DATE_FORMAT\\|DATETIME_FORMAT\\|DEBUG\\|DEFAULT_CHARSET\\|DEFAULT_CONTENT_TYPE\\|DEFAULT_FROM_EMAIL\\|DEFAULT_TABLESPACE\\|DEFAULT_INDEX_TABLESPACE\\|DISALLOWED_USER_AGENTS\\|EMAIL_HOST_PASSWORD\\|EMAIL_HOST_USER\\|EMAIL_HOST\\|EMAIL_PORT\\|EMAIL_SUBJECT_PREFIX\\|EMAIL_USE_TLS\\|FILE_CHARSET\\|FIXTURE_DIRS\\|IGNORABLE_404_ENDS\\|IGNORABLE_404_STARTS\\|INSTALLED_APPS\\|INTERNAL_IPS\\|JING_PATH\\|LANGUAGE_CODE\\|LANGUAGE_COOKIE_NAME\\|LANGUAGES\\|LOCALE_PATHS\\|LOGIN_REDIRECT_URL\\|LOGIN_URL\\|LOGOUT_URL\\|MANAGERS\\|MEDIA_ROOT\\|MEDIA_URL\\|MIDDLEWARE_CLASSES\\|MONTH_DAY_FORMAT\\|PREPEND_WWW\\|PROFANITIES_LIST\\|ROOT_URLCONF\\|SECRET_KEY\\|SEND_BROKEN_LINK_EMAILS\\|SERIALIZATION_MODULES\\|SERVER_EMAIL\\|SESSION_ENGINE\\|SESSION_COOKIE_AGE\\|SESSION_COOKIE_DOMAIN\\|SESSION_COOKIE_NAME\\|SESSION_COOKIE_PATH\\|SESSION_COOKIE_SECURE\\|SESSION_EXPIRE_AT_BROWSER_CLOSE\\|SESSION_FILE_PATH\\|SESSION_SAVE_EVERY_REQUEST\\|SITE_ID\\|TEMPLATE_CONTEXT_PROCESSORS\\|TEMPLATE_DEBUG\\|TEMPLATE_DIRS\\|TEMPLATE_LOADERS\\|TEMPLATE_STRING_IF_INVALID\\|TEST_DATABASE_CHARSET\\|TEST_DATABASE_COLLATION\\|TEST_DATABASE_NAME\\|TEST_RUNNER\\|TIME_FORMAT\\|TIME_ZONE\\|URL_VALIDATOR_USER_AGENT\\|USE_ETAGS\\|USE_I18N\\|YEAR_MONTH_FORMAT\\)" . font-lock-constant-face)
                                      ("\\<\\(get_list_or_404\\|get_object_or_404\\|load_on_render\\|loader\\|render_to_response\\)" . font-lock-function-name-face)
                                      ("\\<[a-zA-Z_]+\\.\\(get_\\(object\\|list\\|iterator\\|count\\|values\\|values_iterator\\|in_bulk\\)\\)" 1 font-lock-function-name-face))
                    ))
          )

;; Autoloads
(add-to-list 'auto-mode-alist '("\\<\\(admin.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(context_processors.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(fields.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(forms.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(handlers.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(models.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(settings.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(signals.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(tests.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(urls.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(views.py\\)" . django-python-mode))
(add-to-list 'auto-mode-alist '("\\<\\(widgets.py\\)" . django-python-mode))

;; Functions
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

;; Hooks
(add-hook 'django-python-mode-hook
          '(lambda ()
             (local-set-key "\C-c\C-t" 'django-python-insert-translation)
             ))

(provide 'django-python-mode)
;; django-python-mode.el ends here
