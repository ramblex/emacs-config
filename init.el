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

(setq custom-file (concat dotfiles-dir "custom.el"))
(setq package-user-dir (concat dotfiles-dir "vendor"))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path package-user-dir)

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(eval-when-compile (require 'cl))

;; Required stuff
(require 'my-defuns)
(require 'my-bindings)
(require 'my-misc)
(require 'my-tab-complete)
(require 'my-rails)
(require 'my-magit)
(require 'my-org)
(require 'my-compilation)
(require 'my-c-mode)
(require 'my-bison)
(require 'my-textmate)

;; Stuff not required on start-up
(autoload 'yaml-mode "my-yaml" "YAML editing mode" t)
(autoload 'php-mode "php-mode" "PHP editing mode" t)

(load custom-file 'noerror)

;; System specific stuff
(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

;;; init.el ends here
