(add-to-list 'load-path (concat package-user-dir "/picovhdl-mode"))

(require 'picovhdl-mode)
(add-to-list 'auto-mode-alist '("\\.vhd$" . picovhdl-vhdl-mode))
(setq picovhdl-c++-indent-offset 2)

(defun set-style ()
  (c-set-style "google"))

(add-hook 'picovhdl-c++-mode-hook 'set-style)

(provide 'my-picovhdl-mode)