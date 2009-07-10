;; Load paths
(setq dotfiles-dir (file-name-directory
      (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(setq customf-file (concat dotfiles-dir "custom.el"))
(setq package-user-dir (concat dotfiles-dir "/vendor"))


;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

