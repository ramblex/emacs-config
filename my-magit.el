(add-to-list 'load-path (concat package-user-dir "/magit"))
(require 'magit)

(defun disable-yas ()
  (setq yas/dont-activate t))

(add-hook 'magit-mode-hook 'disable-yas)

(provide 'my-magit)