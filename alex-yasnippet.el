(setq snippets-dir (concat dotfiles-dir "snippets"))

(require 'yasnippet)
(yas/initialize)
(yas/load-directory snippets-dir)

(provide 'alex-yasnippet)