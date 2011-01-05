;;; starter-kit-dired.el --- Making the defaults a bit saner
;;
;; Part of the Emacs Starter Kit

(require 'dired-x)

;; Omit unwanted files in dired-mode
(setq dired-omit-files 
      (rx (or (seq bol (? ".") "#") ;; emacs autosave files
              (seq "~" eol)         ;; backup-files 
              (seq bol "." (not (any "."))) ;; dot-files 
              (seq ".elc" eol)      ;; compiled elisp source code
              (seq ".pyc" eol)      ;; compiled python source code
              ))) 
 
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1))) 
(put 'dired-find-alternate-file 'disabled nil)

(provide 'starter-kit-dired)
;;; starter-kit-dired.el ends here
