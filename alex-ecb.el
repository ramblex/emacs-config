(load-file (concat package-user-dir "/cedet/common/cedet.el"))

(add-to-list 'load-path (concat package-user-dir "/ecb"))
(require 'ecb)

(defun my-ecb-activate-hook ()
  (modify-all-frames-parameters '((width . 120)))
  (ecb-redraw-layout))
(add-hook 'ecb-activate-hook 'my-ecb-activate-hook)

(defun my-ecb-deactivate-hook ()
  (modify-all-frames-parameters '((width . 80))))
(add-hook 'ecb-deactivate-hook 'my-ecb-deactivate-hook)

(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2)
      ecb-tip-of-the-day nil)

(provide 'alex-ecb)