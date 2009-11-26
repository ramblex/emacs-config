(add-to-list 'load-path (concat package-user-dir "/autopair"))
(require 'autopair)
(autopair-global-mode)

(defun my-autopair-action (action pair pos-before)
  "Trying to emulate the autowrap functionality from
skeleton-insert-maybe. When the region is active, wrap the pair
around the region, otherwise use the default action"
  (if (or (eq last-command 'mouse-drag-region)
          (and transient-mark-mode mark-active))
    (progn
      (if (< (region-beginning) pos-before)
          ;; Make sure that pair opening is at region-beginning
          (let ((open-char (char-before)))
            (delete-backward-char 1)
            (save-excursion
              (goto-char (region-beginning))
              (insert open-char))))
      ;; Insert the closing pair at the end of the region
      (save-excursion
        (goto-char (region-end))
        (insert pair)))
    (autopair-default-handle-action action pair pos-before)))

(setq autopair-handle-action-fns (list 
                                  #'my-autopair-action))

(provide 'my-autopair)
