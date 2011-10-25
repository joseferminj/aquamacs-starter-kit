(require 'paredit) 

(defun turn-on-paredit () (paredit-mode 1))
(defun turn-on-autocomplete () (auto-complete-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-paredit)

;;; Set up autocomplete in SLIME buffer
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'turn-on-paredit)
(add-hook 'slime-repl-mode-hook 'turn-on-autocomplete)
(provide 'starter-kit-clojure)
