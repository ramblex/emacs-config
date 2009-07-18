(add-to-list 'load-path (concat package-user-dir "/markdown"))
(require 'markdown-mode)
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

(provide 'alex-markdown)