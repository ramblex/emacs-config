(set-background-color "gray12")
(set-foreground-color "AntiqueWhite3")
(set-cursor-color "gray37")
(set-face-background 'hl-line "gray9")
(set-face-background 'region "#3d3d3d")
(set-face-foreground 'region "AntiqueWhite2")
(set-face-background 'show-paren-match "OliveDrab")

(set-face-foreground 'font-lock-keyword-face "#949c8b")
(set-face-foreground 'font-lock-constant-face "#6d9cbe")
(set-face-foreground 'font-lock-type-face "#a5c261")
(set-face-foreground 'font-lock-string-face "darkkhaki")
(set-face-foreground 'font-lock-comment-face "#444")

(set-face-background 'magit-item-highlight "gray9")
(set-face-foreground 'magit-diff-add "yellowgreen")
(set-face-foreground 'magit-diff-del "firebrick3")

;(set-face-foreground 'erc-prompt-face "white")

(set-face-background 'erb-out-face "gray10")
(set-face-background 'erb-out-delim-face "gray10")
(set-face-background 'erb-exec-face "gray10")

(require 'eshell)
(set-face-foreground 'eshell-prompt-face "orange")
(set-face-foreground 'eshell-ls-readonly "white")

(require 'whitespace)
(set-face-foreground 'whitespace-space "gray10")
(set-face-background 'whitespace-space "gray12")
(set-face-foreground 'whitespace-newline "gray14")
(set-face-background 'whitespace-trailing "gray11")
(set-face-background 'whitespace-empty "gray12")

(provide 'my-colours)