(defgroup aru/colors nil
  "Group for color themes."
  :prefix "aru/colors/")

(defmacro aru/colors/generate-colors (theme-name name-color-alist)
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

(provide 'aru/colors)
