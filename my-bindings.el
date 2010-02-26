;; Compilation
(global-set-key [f4] 'previous-error)
(global-set-key [f5] 'next-error)
(global-set-key [f6] 'run-fproject-tests)
(global-set-key [f7] 'recompile)
(global-set-key [f8] 'compile)

;; Window navigation
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))
(global-set-key [f2] 'normal)
(global-set-key [f3] 'side-by-side)

;; File navigation
(global-set-key (kbd "M-[") 'backward-paragraph)
(global-set-key (kbd "M-]") 'forward-paragraph)
(global-set-key (kbd "M-5") 'vi-paren-bounce)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

;; File operations
(global-set-key (kbd "C-c C-c") 'comment-region)
(global-set-key (kbd "C-c 9") 'revert-buffer)
(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-o") 'vim-shift-o)
(global-set-key (kbd "C-i") 'vim-o)
(global-set-key (kbd "C--") 'undo)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'my-bindings)
