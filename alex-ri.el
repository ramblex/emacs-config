(add-to-list 'load-path (concat package-user-dir "/ri"))
(require 'ri)
(setq ri-repl-executable (concat package-user-dir "/ri/ri_repl"))

(provide 'alex-ri)