;;; Quick and dirty hack to setup indentation for bison files

(define-derived-mode bison-mode c++-mode "Bison"
  "Major mode for editing Bison files"
  (c-add-language 'bison-mode 'c++-mode)
  (c-set-offset 'topmost-intro '++))

(provide 'bison-mode)

;;(autoload 'bison-mode "my-bison" "Bison editing mode" t)
(add-to-list 'auto-mode-alist '("\\.yy$" . bison-mode))

(provide 'my-bison)