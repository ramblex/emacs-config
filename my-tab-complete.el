(add-to-list 'load-path (concat package-user-dir "/yasnippet"))
(setq snippets-dir (concat dotfiles-dir "snippets"))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory snippets-dir)

(defun run-hippie-expand ()
  (interactive)
  (if (minibufferp (current-buffer))
      (minibuffer-complete)
    (ignore-errors (hippie-expand nil))))

(global-set-key [tab] 'run-hippie-expand)

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

(provide 'my-tab-complete)