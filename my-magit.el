(add-to-list 'load-path (concat package-user-dir "/magit"))
(require 'magit)

(defun magit-tab ()
  (local-set-key [tab] 'magit-toggle-section))

(add-hook 'magit-mode-hook 'magit-tab)

(provide 'my-magit)