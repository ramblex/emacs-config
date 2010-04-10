(add-to-list 'load-path (concat package-user-dir "/nxhtml"))
(load (concat package-user-dir "/nxhtml/autostart.el"))

(set-face-background 'mumamo-background-chunk-major "gray2")
(set-face-background 'mumamo-background-chunk-submode1 "gray10")

(provide 'my-nxhtml)