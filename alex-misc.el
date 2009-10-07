;; Stuff that doesn't fit anywhere else

(when window-system
  (setq frame-title-format '(buffer-file-name "%f"))
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (blink-cursor-mode -1))

(global-font-lock-mode t)
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)
(ido-mode t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-max-prospects 10)
(add-hook 'ido-setup-hook
	  (lambda ()
	    (define-key ido-completion-map [tab] 'ido-complete)))
(setq standard-indent 2)
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)
(set-default 'imenu-auto-rescan t)
(setq ring-bell-function (lambda () t))
(setq-default fill-column 79)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(1))

;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'text-mode-hook 'turn-on-flyspell)

(defun java-indent-fix ()
  (c-set-offset 'substatement-open 0))
(add-hook 'java-mode-hook 'java-indent-fix)

(setq css-indent-offset 2)

;; Turn off the annoying shit in VHDL
(setq vhdl-electric-mode nil)
(setq vhdl-stutter-mode nil)

(setq backup-directory-alist `(("." . ,(expand-file-name
					(concat dotfiles-dir "backups")))))

(provide 'alex-misc)