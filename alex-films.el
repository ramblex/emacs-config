(defconst *films_scripts*
  (expand-file-name "~/film_search/film_search.rb "))

(define-derived-mode films-mode org-mode "Films"
  "Major mode for viewing films")

(add-to-list 'auto-mode-alist '("Films$" . films-mode))

(defun films-list (args conds)
  (interactive (list (read-from-minibuffer "Arguments: ")
                     (read-from-minibuffer "Conditions: ")))
  (shell-command (concat *ruby* " " *films_scripts* args " '" conds 
                         " order by date, start_time asc'")
                 "Films"))

(defun films-set-reminder ()
  "Set a Growl notification reminder for the current line"
  (interactive)
  )

(provide 'alex-films)