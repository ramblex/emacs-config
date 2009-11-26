(add-to-list 'load-path (concat package-user-dir "/autopair"))
(require 'autopair)
(autopair-global-mode)

(defun my-autopair-action (action pair pos-before)
  "Trying to emulate the autowrap functionality from skeleton-insert-maybe"
  (if (or (eq last-command 'mouse-drag-region)
          (and transient-mark-mode mark-active))
    (progn
      (if (< (region-beginning) pos-before)
          ;; Move opening pair to region-beginning
          (let ((opening (char-before)))
            (delete-backward-char 1)
            (save-excursion
              (goto-char (region-beginning))
              (insert opening))))
      ;; Insert the closing pair at the end of the region
      (save-excursion
        (goto-char (region-end))
        (insert pair)))
    (autopair-default-handle-action action pair pos-before)))

(setq autopair-handle-action-fns (list 
                                  #'my-autopair-action))

(provide 'my-autopair)
