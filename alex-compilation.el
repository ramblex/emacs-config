(font-lock-add-keywords
 'compilation-mode
 '(("\\(\\[ FAIL \\]\\)" 1 compilation-error-face prepend)
   ("\\(Failed\\)" 1 compilation-error-face prepend)))
compilation-mode-font-lock-keywords

(provide 'alex-compilation)