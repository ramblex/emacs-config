(add-to-list 'load-path (concat package-user-dir "/rinari"))
(require 'rinari)

(add-to-list 'load-path (concat package-user-dir "/rhtml"))
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook 'rinari-launch)
(add-hook 'rhtml-mode-hook 'alex-electric-mode)
(add-hook 'ruby-mode-hook 'alex-electric-mode)

(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))

(defvar ruby-rails-functions 
  '("add_column"
    "after_create"
    "after_destroy"
    "after_filter"
    "after_generate"
    "after_save"
    "after_validation"
    "after_update"
    "before_create"
    "before_destroy"
    "before_filter"
    "before_save"
    "before_update"
    "belongs_to"
    "belongs_to?"
    "change_column"
    "check_box"
    "content_for"
    "date_select"
    "datetime_select"
    "error_messages"
    "file_field"
    "has_many"
    "has_and_belongs_to_many"
    "image_tag"
    "label"
    "link_to"
    "link_to_function"
    "link_to_if"
    "link_to_remote"
    "link_to_unless"
    "link_to_unless_current"
    "render"
    "submit"
    "text_area"
    "text_field"
    "validate"
    "validate_digest_response"
    "validate_nonce"
    "validate_on_update"
    "validates_acceptance_of"
    "validates_associated"
    "validates_confirmation_of"
    "validates_each"
    "validates_exclusion_of"
    "validates_format_of"
    "validates_inclusion_of"
    "validates_length_of"
    "validates_numericality_of"
    "validates_presence_of"
    "validates_size_of"
    "validates_uniqueness_of"
    )
  "Rails keywords")

(defface rails-font-lock-function-face
  '((t (:foreground "#da4939"))) 
  "Rails functions"
  :group 'rails-font-lock-faces)

(defvar rails-font-lock-function-face 'rails-font-lock-function-face 
  "Face name for rails function font")

(defun rails-keywords (level prepend?)
  (list (concat "\\(^\\|[^_:.@$]\\|\\.\\.\\)\\b\\(defined\\?\\|"
                (regexp-opt ruby-rails-functions t)
                "\\)"
                ruby-keyword-end-re)
        level rails-font-lock-function-face (if prepend? 'prepend)))

(font-lock-add-keywords
 'ruby-mode
 (list (rails-keywords 2 nil)))

(setq rhtml-in-erb-keywords
      (append rhtml-in-erb-keywords
              (list (rails-keywords 1 t))))

(provide 'alex-rails)