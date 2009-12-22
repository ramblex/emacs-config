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
		  (t (error "%s" "Not on a paren, brace, or bracket")))))

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
  (modify-frame-parameters (selected-frame) '((width . 163) (height . 46)))
  (if (one-window-p)
      (split-window-horizontally)))

(defun normal ()
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

(defun print-to-pdf ()
  "Save a buffer to pdf ready for printing"
  (interactive)
  (setq output-file (read-from-minibuffer "Save to: "))
  (ps-spool-buffer-with-faces)
  (switch-to-buffer "*PostScript*")
  (write-file "/tmp/tmp.ps")
  (kill-buffer "tmp.ps")
  (setq cmd (concat "ps2pdf14 /tmp/tmp.ps " output-file))
  (shell-command cmd)
  (shell-command "rm /tmp/tmp.ps")
  (message (concat "Saved to: " output-file)))

;; Functions from http://nflath.com/2009/11/java-and-c-utilities/
(defun my-fn (fn prompt)
  "When given a function taking one argument and applying a function to it, will use that function
   and default to the word at point, with a prompt including that word."
  (let ((default (current-word)))
    (let ((needle (read-string (concat prompt " <" default ">: "))))
      (if (equal needle "")
          (funcall fn default)
        (funcall fn needle)))))
 
(defmacro defun-my (name prompt &rest body)
  "Will define both a function and a my- version of the function,
which defaults to the word at point."
  `(progn
     (defun ,name (arg) ,@body)
     (defun ,(intern (concat "my-" (symbol-name name))) ()
       (interactive)
       (my-fn (quote ,name) ,prompt))))

(defun create-file-list (directory buffer)
  "Creates the list of files in a directory"
  (save-window-excursion
    (let ((default-directory directory))
      (shell-command "find . " buffer)
      (switch-to-buffer buffer)
      (flush-lines "\.svn")
      (flush-lines "class-use"))))
 
(defun find-location-for-doc-from-buffer (arg buffer-name buffer-creation-fn begin)
  "Finds the file for a given documentation name in the buffer
that may be created with buffer-creation"
  (save-excursion
    (save-window-excursion
      (let ((doc-buffer (or (get-buffer buffer-name)
                            (funcall buffer-creation-fn))))
        (switch-to-buffer doc-buffer)
        (goto-char (point-min))
        (while (not (line-matches (concat "/" arg "\.html")))
          (search-forward arg))
        (concat begin
                (buffer-substring (1+ (line-beginning-position))
                                  (line-end-position)))))))

(defun line-matches (regexp)
  "Returns non-nil if the current line matches the given regexp, nil otherwise."
  (save-excursion
    (end-of-line)
    (let ((end (point)))
      (beginning-of-line)
      (re-search-forward regexp end t))))

(defun vim-o ()
  "make a new line below this no matter where point is on the current line.
This mimics using o in vim in command mode"
  (interactive)
  (end-of-line)
  (newline))

(defun vim-shift-o ()
  "make a new line above this no matter where point is on the current line.
This mimics O in vim in command mode"
  (interactive)
  (previous-line)
  (end-of-line)
  (newline))

(provide 'my-defuns)