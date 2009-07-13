(add-to-list 'load-path (concat package-user-dir "/color-theme"))
(require 'color-theme)

(defun color-theme-railscasts ()
  "A colour theme based on railscasts"
  (interactive)
  (color-theme-install
   '(color-theme-railscasts
     ((background-color . "#2b2b2b")
      (foreground-color . "#ffffff")
      (cursor-color . "#6b6b6b"))
     (hl-line ((t (:background "#262626"))))
     (region ((t (:background "#5a647e"))))
     (highlight ((t (:background "#4b4b4b"))))
     (fringe ((t (:background "#2b2b2b"))))
     (show-paren-match-face ((t (:background "#75a6ab"))))
     (modeline ((t (:bold nil :foreground "grey80" :background "grey30" ))))
     (modeline-inactive ((t (:foreground "#777777" :background "grey30" ))))
     (modeline-buffer-id ((t (:bold nil :foreground "#ffffff" ))))
     (minibuffer-prompt ((t (:bold t :foreground "#708090"))))
     (font-lock-builtin-face ((t (:foreground "#8ac6f2"))))
     (font-lock-comment-face ((t (:italic t :foreground "#bc9458"))))
     (font-lock-constant-face ((t (:foreground "#6e9cbe"))))
     (font-lock-doc-face ((t (:foreground "#a5c261"))))
     (font-lock-function-name-face ((t (:foreground "#ffc66d"))))
     (font-lock-keyword-face ((t (:foreground "#cc7833"))))
     (font-lock-preprocessor-face ((t (:foreground "d0d0ff"))))
     (font-lock-reference-face ((t (:bold nil :foreground "#808bed"))))
     (font-lock-string-face ((t (:foreground "#a5c261"))))
     (font-lock-type-face ((t (:foreground "#ffffff"))))
     (font-lock-variable-name-face ((t (:foreground "#d0d0ff"))))
     (font-lock-warning-face
      ((t (:foreground "#ffffff" :background "#da4939"))))
     (rails-font-lock-function-face ((t (:foreground "#da4939"))))
     (erb-delim-face ((t (:normal t :foreground "#ffffff" :background "#242424"))))
     (erb-exec-delim-face ((t (:normal t :foreground "#ffffff" :background "#242424"))))
     (erb-out-delim-face ((t (:normal t :foreground "#ffffff" :background "#242424"))))
     (erb-face ((t (:background "#242424"))))
     (ecb-default-highlight-face ((t (:background "#5a647e"
                                                  :foreground "#f6f3e8"))))
     (yas/field-highlight-face ((t (:background "grey13"))))
     )))

(color-theme-initialize)
;; Don't start automatically - some stuff is missed out anyway
;;(color-theme-railscasts)

(provide 'alex-color-theme)