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

(defun my-ecb-activate ()
  "Start up ECB"
  (interactive)
  (require 'alex-ecb)
  (ecb-activate))

(defun run-fproject-tests ()
  "Run tests for final year project"
  (interactive)
  (compile "cd /Users/alexduller/project/bsisim/test/; ./run_tests.rb"))

(provide 'alex-defuns)