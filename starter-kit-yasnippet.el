;;; starter-kit-yasnippet.el
;;
;; Part of the Emacs Starter Kit

(yas/load-directory (expand-file-name "snippets" dotfiles-dir))
(setq yas/use-menu 'abbreviate)

(provide 'starter-kit-yasnippet)
;; starter-kit-yasnippet.el ends here
