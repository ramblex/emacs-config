(font-lock-add-keywords
 'compilation-mode
 '(("\\(\\[ FAIL \\]\\)" 1 compilation-error-face prepend)
   ("\\(Failed\\)" 1 compilation-error-face prepend)
   ("\\(Passed\\)" 1 compilation-info)))

(provide 'my-compilation)