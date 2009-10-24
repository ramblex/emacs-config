(require 'bison-mode)

;;(autoload 'bison-mode "my-bison" "Bison editing mode" t)
(add-to-list 'auto-mode-alist '("\\.yy$" . bison-mode))

(provide 'my-bison)