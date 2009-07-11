(defun color-theme-railscasts ()
  "A colour theme based on railscasts"
  (interactive)
  (color-theme-install
   '(color-theme-railscasts
     ((background-color . "#2b2b2b")
      (background-mode . dark)
      (foreground-color . "#ffffff"))
     (hl-line ((t (:background "#262626"))))
     (region ((t (:background "#5a647e"))))
     (highlight ((t (:background "#4b4b4b"))))
     (fringe ((t (:background "#2b2b2b"))))
     (show-paren-match-face ((t (:foreground "#f6f3e8" :background "#857b6f"))))
     (modeline ((t (:bold nil :foreground "grey80" :background "grey30" :height 95))))
     (modeline-inactive ((t (:foreground "#777777" :background "grey30" :height 95))))
     (modeline-buffer-id ((t (:bold nil :foreground "#ffffff" :height 95))))
     (minibuffer-prompt ((t (:bold t :foreground "#708090"))))
     (font-lock-builtin-face ((t (:foreground "#8ac6f2"))))
     (font-lock-comment-face ((t (:italic t :foreground "#bc9458"))))
     (font-lock-constant-face ((t (:foreground "#d0d0ff"))))
     (font-lock-doc-face ((t (:foreground "#a5c261"))))
     (font-lock-function-name-face ((t (:foreground "#ffc66d"))))
     (font-lock-keyword-face ((t (:foreground "#cc7833"))))
     (font-lock-preprocessor-face ((t (:foreground "d0d0ff"))))
     (font-lock-reference-face ((t (:bold nil :foreground "#808bed"))))
     (font-lock-string-face ((t (:foreground "#a5c261"))))
     (font-lock-type-face ((t (:foreground "#d0d0ff"))))
     (font-lock-variable-name-face ((t (:foreground "#6e9cbe"))))
     (font-lock-warning-face
      ((t (:foreground "#ffffff" :background "#da4939"))))
     (rails-font-lock-function-face ((t (:foreground "#da4939"))))
     (erb-delim-face ((t (:bold nil :italic nil :foreground "#ffffff"
                                :background "#242424"))))
     (erb-out-delim-face ((t (:bold nil :italic nil :foreground "#ffffff"
                                    :background "#242424"))))
     (erb-face ((t (:background "#242424"))))
     (ecb-default-highlight-face ((t (:background "#5a647e"
                                                  :foreground "#f6f3e8"))))
     (ecb-default-general-face ((t (:height 95))))
     (ecb-directories-general-face ((t (:height 95))))
     (yas/field-highlight-face ((t (:background "grey13"))))
     )))

(provide 'my-color-themes)