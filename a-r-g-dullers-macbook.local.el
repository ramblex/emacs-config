(setq mac-pass-command-to-system nil)
(setq ns-alternate-modifier (quote none))
(setq ns-command-modifier (quote meta))
(setenv "PATH" (concat (getenv "PATH") ":/sw/bin"))
(setq exec-path (append exec-path '("/sw/bin")))

(defun bja-growl-notification (title message &optional sticky)
  "Send a Growl notification"
  (do-applescript
   (format "tell application \"GrowlHelperApp\"
              notify with name \"Emacs Notification\" title \"%s\" description \"%s\" application name \"Emacs.app\" sticky %s
           end tell"
           title
           (replace-regexp-in-string "\"" "''" message)
           (if sticky "yes" "no"))))

(defun bja-growl-timer (minutes message)
  "Issue a Growl notification after specified minutes"
  (interactive (list (read-from-minibuffer "Minutes: " "10")
                     (read-from-minibuffer "Message: " "Reminder") ))
  (run-at-time (* (string-to-number minutes) 60)
               nil
               (lambda (minutes, message)
                 (bja-growl-notification "Emacs Reminder" message t))
               minutes
               message))

(defun bja-growl-alarm (time minutes message)
  "Issue a Growl notification at a specified time"
  (run-at-time time
               nil
               (lambda (minutes, message)
                 (bja-growl-notification "Emacs Reminder" message t))
               minutes
               message))
