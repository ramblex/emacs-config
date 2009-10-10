;; Use textmate style auto-insert of parens
(add-to-list 'load-path (concat package-user-dir "/textmate"))

(require 'textmate)
(tm/initialize)
(setq tm/use-newline-and-indent t)
(setq tm/use-goto-line nil)

(provide 'my-textmate)