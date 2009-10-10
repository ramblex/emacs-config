;;; init.el --- Where everything begins
;;
;; Adapted from Emacs starter kit
;;
;; This is called from .emacs

(defvar *emacs-load-start* (current-time))

;; Start the emacs server...go go go!
(server-start)

;; Load paths
(setq dotfiles-dir (file-name-directory
      (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "vendor"))

(setq custom-file (concat dotfiles-dir "custom.el"))
(setq package-user-dir (concat dotfiles-dir "vendor"))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session

(require 'cl)
;(require 'saveplace)
;(require 'ffap)
;(require 'uniquify)
;(require 'ansi-color)
;(require 'recentf)

;; Required stuff
(require 'alex-defuns)
(require 'alex-bindings)
(require 'alex-misc)
(require 'alex-tab-complete)
(require 'alex-rails)
(require 'alex-magit)
(require 'alex-org)
(require 'alex-compilation)
(require 'alex-c-mode)
(require 'alex-bison)
(require 'alex-textmate)

;; Stuff not required on start-up
(autoload 'films-list "alex-films" "List films on TV" t)
(autoload 'yaml-mode "alex-yaml" "YAML editing mode" t)
(autoload 'php-mode "php-mode" "PHP editing mode" t)

(load custom-file 'noerror)

;; System specific stuff

(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

(message "emacs loaded in %ds" (destructuring-bind (hi lo ms) (current-time)
                           (- (+ hi lo) (+ (first *emacs-load-start*) (second *emacs-load-start*)))))

(desktop-save-mode t)
(desktop-read)

;;; init.el ends here
