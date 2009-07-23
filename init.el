;;; init.el --- Where everything begins
;;
;; Adapted from Emacs starter kit
;;
;; This is called from .emacs

;; Start the emacs server...go go go!
(server-start)

;; Load paths
(setq dotfiles-dir (file-name-directory
      (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

(setq custom-file (concat dotfiles-dir "custom.el"))
(setq package-user-dir (concat dotfiles-dir "/vendor"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load up custom stuff

;; Required stuff
(require 'alex-defuns)
(require 'alex-bindings)
(require 'alex-misc)
(require 'alex-tab-complete)

;; Stuff to load up when needed - modes and such like
(require 'alex-rails)
(require 'alex-electric)
(require 'alex-color-theme)
(require 'alex-magit)
(require 'alex-yaml)
(require 'alex-php)
(require 'alex-haml)
(require 'alex-markdown)

(load custom-file 'noerror)

;; System specific stuff

(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

;;; init.el ends here
