;; CC mode configuration

(defun c++-indent-fix ()
  (c-set-offset 'inline-open 0))
(add-hook 'c++-mode-hook 'c++-indent-fix)

(defun-my c++-doc-lookup "Documentation for"
  "Search C++ documentation for the requested term"
  (browse-url (find-location-for-doc-from-buffer
              arg
              "*C Documentation*"
              (lambda () (create-file-list 
                          "~/emacs-config/doc/c++/" 
                          "*C Documentation*"))
              "~/emacs-config/doc/c++/")))

(defun my-compile ()
  (unless (or (file-exists-p "makefile")
              (file-exists-p "Makefile"))
    (set (make-local-variable 'compile-command)
         (concat "g++ -Wall -o " 
                 (file-name-directory (buffer-file-name)) "test " 
                 (buffer-file-name)))))
(add-hook 'c++-mode-hook 'my-compile)

(require 'google-c-style)
(add-hook 'c++-mode-hook 'google-set-c-style)
(add-hook 'c-mode-hook 'google-set-c-style)

(add-to-list 'auto-mode-alist '("\\.lex$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("README$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.hpp$" . c++-mode))
; From my final year project
(add-to-list 'auto-mode-alist '("\\.template" . c++-mode))

(provide 'my-c-mode)