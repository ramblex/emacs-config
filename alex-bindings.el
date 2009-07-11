(global-set-key "\C-c\C-k" 'copy-line)
(global-set-key [f7] 'recompile)
(global-set-key [f8] 'mode-compile)
(global-set-key [f10] 'next-error)
(global-set-key [f11] 'previous-error)
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-5") 'vi-paren-bounce)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
(global-set-key "\C-xg" 'magit-status)

(provide 'alex-bindings)
