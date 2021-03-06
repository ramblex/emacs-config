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

;; Start a shell
;(eshell)

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
;(require 'my-bison)
(require 'my-autopair)
(require 'my-php)
(require 'my-asciidoc)
(require 'my-picovhdl-mode)
(require 'my-colours)
(require 'my-prolog)
(require 'my-nxhtml)

;; Stuff not required on start-up
(autoload 'yaml-mode "my-yaml" "YAML editing mode" t)
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on major mode" t)

(load custom-file 'noerror)

;; Set up the frame size

(normal)

;;; init.el ends here
