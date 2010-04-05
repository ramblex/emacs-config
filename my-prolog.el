(require 'prolog)
(setq prolog-system 'swi)
;(add-to-list 'auto-mode-alist '("\\.pl$" . prolog-mode))
(setenv "EPROLOG" "/opt/local/bin/swipl")
(setq prolog-program-name "swipl")

(provide 'my-prolog)