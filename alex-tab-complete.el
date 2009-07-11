(setq snippets-dir (concat dotfiles-dir "snippets"))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory snippets-dir)

;(global-set-key [(tab)] 'hippie-expand)

;; Hippie expand
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
 	try-expand-dabbrev-from-kill
 	try-complete-file-name-partially
 	try-complete-file-name
 	try-complete-lisp-symbol-partially
 	try-complete-lisp-symbol
 	indent-for-tab-command))

(provide 'alex-tab-complete)