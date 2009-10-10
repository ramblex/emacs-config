;; Copy line
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))
(setq-default kill-read-only-ok t)

(defun vi-paren-bounce ()
  "Bounce between parens like in VI"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
	(next-char (char-to-string (following-char))))
	(cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
		  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
		  (t (error "%s" "Not on a paren, brace, or bracket"))))
)

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))

(defun side-by-side ()
  "The perfect size for having two windows side by side"
  (interactive)
  (modify-frame-parameters (selected-frame) '((width . 166) (height . 46)))
  (if (one-window-p)
      (split-window-horizontally)))

(defun normal-window ()
  "Change to only one window of width 80"
  (interactive)
  (modify-frame-parameters (selected-frame) '((width . 80) (height . 46)))
  (delete-other-windows))

(defun generate-etags ()
  "Generate etags for the current directory"
  (interactive)
  (shell-command "find . -name \"*.[ch]*\" -print | etags -"))

(defun file-name-sans-ext ()
  "Return the current file name without extension"
  (substring (file-name-nondirectory (buffer-file-name)) 
 0 (string-match "\\." (file-name-nondirectory (buffer-file-name)))))

;; Final year project stuff
(require 'comint)
(defconst *ruby* "/usr/bin/ruby")
(defconst *tests*
  (expand-file-name "~/project/simgen/test/run_tests.rb"))

(defun my-run-tests ()
  "Run final year project tests using comint"
  (interactive)
  (apply 'make-comint "Tests" *ruby* nil (list *tests*))
  (switch-to-buffer-other-window "*Tests*"))

(defun run-fproject-tests ()
  "Run tests for final year project"
  (interactive)
  (compile 
   "cd /Users/alexduller/project/simgen/test/; ./run_tests.rb --no-colours"))

(provide 'alex-defuns)