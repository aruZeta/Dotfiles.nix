(require 'aru/faces)

(defvar *group* "")
(defun get-symbol (name &optional group)
  (intern-soft (concat (or group *group*) name)))

(defmacro aru/themes/generate-theme (theme-name)
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
                           :foreground ,(get-symbol "gold"))

       (set-face-attribute 'aru/faces/modeline nil
                           :background ,(get-symbol "overlay"))

       (set-face-attribute 'aru/faces/modeline-inactive nil
                           :background ,(get-symbol "surface")
                           :foreground ,(get-symbol "faded")))))

(provide 'aru/themes)
