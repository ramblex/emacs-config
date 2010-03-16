(require 'yasnippet)
(yas/initialize)
;; (setq yas/root-directory '("~/emacs-config/snippets"
;;                            "~/emacs-config/vendor/yasnippet/snippets"))
(yas/load-directory (concat dotfiles-dir "snippets"))
;; (setq yas/ignore-filenames-as-triggers t)
(setq yas/prompt-functions '(yas/dropdown-prompt
                             yas/ido-prompt
                             yas/completing-prompt))

(defun run-hippie-expand ()
  (interactive)
  (if (minibufferp (current-buffer))
      (minibuffer-complete)
    (ignore-errors (hippie-expand nil))))

(global-set-key [tab] 'run-hippie-expand)

;; Hippie expand
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        indent-for-tab-command
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
 	try-expand-dabbrev-from-kill
 	try-complete-file-name-partially
 	try-complete-file-name
; 	try-complete-lisp-symbol-partially
; 	try-complete-lisp-symbol
 	))

(provide 'my-tab-complete)