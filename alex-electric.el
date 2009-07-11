(define-minor-mode alex-electric-mode
  "Toggle Textmate mode.
     With no argument, this command toggles the mode.
     Non-null prefix argument turns on the mode.
     Null prefix argument turns off the mode. "     
  nil
  ;; The indicator for the mode line.
  " elec"
  ;; The minor mode bindings.
  '(([backspace] . textmate-backspace2)
    ("\"" . move-over-dbl-quote)
;    ("\'" . move-over-quote)
    ("|" . move-over-pipe)
    (")" . move-over-bracket)
    ("]" . move-over-square)
    ("}" . move-over-curly)
    ("[" . skeleton-pair-insert-maybe)
    ("(" . skeleton-pair-insert-maybe)
    ("{" . skeleton-pair-insert-maybe)
    ;; Duplicate TextMate's auto-indent
    ([return] . newline-and-indent)
    ;; Duplicate TextMate's command-return
    ("\M-\r" . open-next-line)
    ;; Duplicate TextMate's goto line
    ("\M-l" . goto-line))
  :group 'textmate
  (progn
    (setq skeleton-pair t))
  )

;;implementation stuff

;; Function to open and goto indented next line
(defun open-next-line()
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(setq textmate-pairs 
      '(( ?\( . ?\) )
        (  ?\' . ?\' )
        (  ?\" . ?\" )
        (  ?[ . ?] )
        (  ?{ . ?} )
        ( ?| . ?|)))

(defun is-empty-pair ()
  (interactive)
  (eq (cdr (assoc (char-before)  textmate-pairs)) (char-after)))

(defun textmate-backspace2 ()
  (interactive)
  (if (eq (char-after) nil)
      nil   ;; if char-after is nil, just backspace
    (if (is-empty-pair)
        (delete-char 1)))
  (delete-backward-char 1))

(setq pushovers
      '((?\" . (lambda () (forward-char 1) ))
        (?\' . (lambda () (forward-char 1) ))
        (?\) . (lambda () (up-list 1) ))
        (?\] . (lambda () (up-list 1) ))
        (?\} . (lambda () (up-list 1) ))
        (?\| . (lambda () (forward-char 1)))
        ))

(setq defaults
      '((?\" . (lambda () (skeleton-pair-insert-maybe nil) ))
        (?\' . (lambda () (skeleton-pair-insert-maybe nil) ))
        (?\) . (lambda () (insert-char ?\) 1) ))
        (?\] . (lambda () (insert-char ?\] 1) ))
        (?\} . (lambda () (insert-char ?\} 1) ))
        (?\| . (lambda () (skeleton-pair-insert-maybe nil)))
        ))

(defun move-over (char)
  (if (eq (char-after) char)
      (funcall (cdr (assoc char pushovers)))
    (funcall (cdr (assoc char defaults)))))

(defun move-over-bracket ()  (interactive)(move-over ?\) ))
(defun move-over-curly ()  (interactive)(move-over ?\} ))
(defun move-over-square ()  (interactive)(move-over ?\] ))
(defun move-over-quote ()  (interactive)(move-over ?\' ))
(defun move-over-dbl-quote ()  (interactive)(move-over ?\" ))
(defun move-over-pipe () (interactive) (move-over ?\|))

(provide 'alex-electric)