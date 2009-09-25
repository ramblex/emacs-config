;; CC mode configuration

(defun c++-indent-fix ()
  (c-set-offset 'inline-open 0))
(add-hook 'c++-mode-hook 'c++-indent-fix)

(defun my-compile ()
  (unless (or (file-exists-p "makefile")
              (file-exists-p "Makefile"))
    (set (make-local-variable 'compile-command)
         (concat "g++ -Wall -o test " (buffer-file-name)))))
(add-hook 'c++-mode-hook 'my-compile)

(add-to-list 'auto-mode-alist '("\\.lex$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ll$" . c++-mode))
(add-to-list 'auto-mode-alist '("README$" . text-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

(autoload 'webjump "webjump"
  "Jumps to a website from a programmable hotlist" t)

(eval-after-load "webjump"
  '(progn
     (setq webjump-sites
           (append 
            '(
              ("STL" .
               [simple-query
                "http://www.sgi.com/tech/stl/index.html"
                "http://www.google.com/search?q="
                "+site%3Awww.sgi.com%2Ftech%2Fstl"])
              ("Boost" .
               [simple-query
                "http://www.boost.org/doc/libs/1_39_0/libs/libraries.htm"
                "http://www.google.com/search?q="
                "+site%3Awww.boost.org%2Fdoc%2Flibs%2F1_39_0%2Fdoc%2F"
                ])
              ("CPP" .
               [simple-query
                "http://www.cplusplus.com/reference/"
                "http://www.cplusplus.com/query/search.cgi?q=" ""])
              )
            webjump-sample-sites))))

(provide 'alex-c-mode)