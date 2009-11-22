(add-to-list 'load-path (concat package-user-dir "/doc-mode"))
(require 'doc-mode)

(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))

(provide 'my-doc-mode)