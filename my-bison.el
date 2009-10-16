(setq bison-syntax-table (make-syntax-table c-mode-syntax-table))
(modify-syntax-entry ?% "< 2b" bison-syntax-table)

(setq bison-delim "%%")
(setq bison-c-delim-start "%{")
(setq bison-c-delim-end "%}")

(defun bison-get-contexxt ()
  "Determine the context of the current position"
  (save-excursion
    (re-search-backward bison-delim (beginning-of-buffer) t))
  )


(defun bison-fontify-buffer ()
  (interactive)
  (jit-lock-refontify))

(defun bison-fontify-block (type begin end)
  (let ((delim-face))))

(defun bison-fontify-region (begin end)
  (save-excursion
    (goto-char begin)
    (search-backward bison-open-delim nil t)
    (setq begin (point))
    (goto-char end)
    (search-forward bison-close-delim nil t)
    (setq end (point)))
  (mapc (lambda (i)
          (bison-unfontify-region (nth 1 i) (nth 2 i))
          (apply 'bison-fontify-block i))
        (bison-regions begin end)))

(define-derived-mode bison-mode c++-mode "Bison"
  "Major mode for editing Bison files"
  (c-add-language 'bison-mode 'c++-mode)
  (bison-activate-fontification))

(provide 'bison-mode)

;;(autoload 'bison-mode "my-bison" "Bison editing mode" t)
(add-to-list 'auto-mode-alist '("\\.yy$" . bison-mode))

(provide 'my-bison)