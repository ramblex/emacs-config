(org-remember-insinuate)
(setq org-directory "~")
(setq org-default-notes-file (concat org-directory "/projects.org"))
(setq org-log-done t)
(setq org-agenda-files (list "~/project/org/todo.org"
                             "~/org/projects.org"
                             "~/org/todo.org"))
(defun in-dir (dir)
  (interactive)
  (string= (substring (buffer-file-name) 0 (length dir)) dir))

(defun in-project-dir
  (in-dir "/Users/alexduller/"))

(setq org-remember-templates
      '(("Todo" ?t "* TODO %?\n  %i\n  %a" "~/project/org/todo.org" "Simulator")
        ("Bug" ?b "* BUG %?\n  %i\n  %a" "~/project/org/bugs.org" "Bugs")))

(provide 'alex-org)