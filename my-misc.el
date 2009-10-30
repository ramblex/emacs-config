;; Stuff that doesn't fit anywhere else

(when window-system
  (setq frame-title-format '(buffer-file-name "%f"))
  (tooltip-mode -1)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(global-font-lock-mode t)
(setq inhibit-startup-message t)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(set-default 'indicate-empty-lines t)
(setq ring-bell-function (lambda () t))

;; Turn off auto-saving
(setq auto-save-default nil)

;; Mouse
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1))

;; ido mode
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-max-prospects 10)
(defun ido-complete-hook ()
  (define-key ido-completion-map [tab] 'ido-complete))
(add-hook 'ido-setup-hook 'ido-complete-hook)

;; Auto-fill mode
(setq-default fill-column 79)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)

;; Indentation
(setq standard-indent 2)
(set-default 'indent-tabs-mode nil)

(defun java-indent-fix ()
  (c-set-offset 'substatement-open 0))
(add-hook 'java-mode-hook 'java-indent-fix)

(setq css-indent-offset 2)

;; Turn off the annoying shit in VHDL
(setq vhdl-electric-mode nil)
(setq vhdl-stutter-mode nil)

;; Don't make backups - use git...
(setq make-backup-files nil)

(provide 'my-misc)