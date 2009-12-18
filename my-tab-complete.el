(add-to-list 'load-path (concat package-user-dir "/yasnippet"))
(setq snippets-dir (concat package-user-dir "/yasnippet/snippets"))
(setq my-snippets-dir (concat dotfiles-dir "snippets"))

(stringp snippets-dir)

(require 'yasnippet)
(yas/initialize)
(setq yas/root-directory '("~/emacs-config/snippets"
                           "~/emacs-config/vendor/yasnippet/snippets"))
(mapc 'yas/load-directory yas/root-directory)
(setq yas/ignore-filenames-as-triggers t)
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
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
 	try-expand-dabbrev-from-kill
 	try-complete-file-name-partially
 	try-complete-file-name
 	try-complete-lisp-symbol-partially
 	try-complete-lisp-symbol
 	indent-for-tab-command))

(provide 'my-tab-complete)