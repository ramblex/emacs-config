(add-to-list 'load-path (concat package-user-dir "/color-theme"))
(require 'color-theme)
(require 'my-color-themes)
(color-theme-initialize)
(color-theme-railscasts)

(provide 'color-theme-setup)
