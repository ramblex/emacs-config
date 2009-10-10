(org-remember-insinuate)
(setq org-directory "~")
(setq org-default-notes-file (concat org-directory "/projects.org"))
(setq org-log-done t)
(setq org-agenda-files (list "~/project/org/todo.org"
                             "~/org/projects.org"
                             "~/org/todo.org"))

(provide 'my-org)