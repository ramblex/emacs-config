(setq snippets-dir (concat dotfiles-dir "snippets"))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory snippets-dir)

(setq yas/fallback-behavior 'run-hooks)
(defun run-hippie-expand ()
  (ignore-errors (hippie-expand nil)))
(add-hook 'yas/snippet-not-found-hook 'run-hippie-expand)

;; Hippie expand
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-all-buffers
 	try-expand-dabbrev-from-kill
 	try-complete-file-name-partially
 	try-complete-file-name
 	try-complete-lisp-symbol-partially
 	try-complete-lisp-symbol
 	indent-for-tab-command))

(provide 'my-tab-complete)