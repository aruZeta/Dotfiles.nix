(require 'aru/faces)
(require 'aru/colors)

(defvar *group* "")
(defun get-symbol (name &optional group)
  (intern-soft (concat (or group *group*) name)))

(defmacro aru/themes/rose-pine-set-theme (theme-name)
  "Set color theme to VARIANT."
  (let ((*group* (concat "aru/colors/" theme-name "/")))
    `(progn
       (set-background-color ,(get-symbol "base"))
       (set-foreground-color ,(get-symbol "text"))

       (set-face-attribute 'default nil
                           :family "Iosevka"
                           :height 120)

       (set-face-attribute 'aru/faces/very-important nil
                           :weight 'ultra-heavy)

       (set-face-attribute 'aru/faces/important nil
                           :weight 'bold)

       (set-face-attribute 'aru/faces/less-important nil
                           :weight 'medium
                           :foreground ,(get-symbol "foam"))

       (set-face-attribute 'aru/faces/not-important nil
                           :weight 'light
                           :foreground ,(get-symbol "muted"))

       (set-face-attribute 'aru/faces/not-important-color nil
                           :weight 'light
                           :foreground ,(get-symbol "iris"))

       (set-face-attribute 'aru/faces/warning nil
                           :weight 'semi-light
                           :foreground ,(get-symbol "gold"))

       (set-face-attribute 'aru/faces/danger nil
                           :weight 'semi-light
                           :foreground ,(get-symbol "love"))

       (set-face-attribute 'aru/faces/success nil
                           :weight 'semi-light
                           :foreground ,(get-symbol "pine"))

       (set-face-attribute 'aru/faces/selected nil
                           :background ,(get-symbol "highlight-med"))

       (set-face-attribute 'aru/faces/selected-important nil
                           :background ,(get-symbol "gold"))

       (set-face-attribute 'aru/faces/diff-added nil
                           :weight 'bold
                           :foreground ,(get-symbol "pine"))

       (set-face-attribute 'aru/faces/diff-removed nil
                           :weight 'bold
                           :foreground ,(get-symbol "love"))

       (set-face-attribute 'aru/faces/diff-changed nil
                           :weight 'bold
                           :foreground ,(get-symbol "gold")))))


(defmacro aru/themes/rose-pine-generate-colors (theme-name name-color-alist)
  "Creates variables via defcustom and adds them to group aru/colors/THEME-NAME.
The name of each variable is aru/colors/THEME-NAME/NAME and the value is COLOR."
  (let* ((color-group "aru/colors")
         (theme-full (concat color-group "/" theme-name))
         (theme-symbol (intern theme-full))
         (f-list
          `((defgroup ,theme-symbol nil
              ,(concat "Colors from the " theme-name " theme.")
              :prefix ,(concat theme-full "/")
              :group  'aru/colors))))
    (dolist (name-color-cons name-color-alist `(progn ,@f-list))
      (let ((name (car name-color-cons))
            (color (cdr name-color-cons)))
        (push `(defcustom ,(intern (concat theme-full "/" name)) ,color
                 ,(concat name " color of " theme-name " theme.")
                 :group (quote ,theme-symbol)
                 :type 'string)
              f-list)))))

(provide 'aru/themes/rose-pine-common)
