;;; Enable syntax highlighting in source blocks
(setq org-src-fontify-natively t)

;;; Disable the confirmation before each evaluation
(setq org-confirm-babel-evaluate nil)

;;; Enable clojure and disable emacs-lisp
(org-babel-do-load-languages
 'org-babel-load-languages
 '((clojure . t)
   (emacs-lisp . nil)
   ))

(provide 'starter-kit-org)
