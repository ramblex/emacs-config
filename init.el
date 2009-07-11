;;; init.el --- Where everything begins
;;
;; Adapted from Emacs starter kit
;;
;; This is called from .emacs

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

(require 'alex-defuns)
(require 'alex-bindings)
(require 'alex-misc)
(require 'alex-tab-complete)
(require 'alex-rails)
(require 'alex-ecb)
(require 'alex-color-theme)
(require 'alex-electric)
(require 'alex-magit)

(load custom-file 'noerror)

;; System specific stuff

(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

;;; init.el ends here
