(add-to-list 'load-path (concat package-user-dir "/rinari"))
(require 'rinari)

(add-to-list 'load-path (concat package-user-dir "/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'rinari-launch)

(provide 'rails-setup)