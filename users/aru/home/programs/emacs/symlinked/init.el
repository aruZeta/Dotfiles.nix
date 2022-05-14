;;;; User

(setq user-full-name    "Alberto Robles Gomez"
      user-mail-address "aru_hackZ.official@zohomail.eu")

;;;; Clean emacs

(setq inhibit-startup-screen  t
      initial-scratch-message nil)

(scroll-bar-mode 0)
(tool-bar-mode   0)
(tooltip-mode    0)
(menu-bar-mode   0)

;;;; Evil

(setq evil-want-keybinding nil)

(evil-mode 1)
(evil-collection-init)

(setq evil-collection-outline-bind-tab-p         t
      evil-collection-calendar-want-org-bindings t
      evil-collection-setup-minibuffer           t)

;;;; Frame

(setq default-frame-alist '((left-fringe          . 0)
                            (right-fringe         . 0)
                            (vertical-scroll-bars . nil)))

;;;; Window

(setq-default left-margin-width  5
              right-margin-width 5)

;;;; Lines

(setq-default line-spacing-vertical-center t ; check my emacs patches
              line-spacing                 0.3)

;;;; Cursor

(blink-cursor-mode 0)

;;;; Colors

(defgroup aru/colors nil
  "Group for color themes."
  :prefix "aru/colors/")

(defmacro aru/generate-color-theme (theme-name name-color-alist)
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

(aru/generate-color-theme "rose-pine-dawn"
                          (("base"           . "#faf4ed")
                           ("surface"        . "#fffaf3")
                           ("overlay"        . "#f2e9e1")
                           ("muted"          . "#9893a5")
                           ("subtle"         . "#797593")
                           ("text"           . "#575279")
                           ("love"           . "#b4637a")
                           ("gold"           . "#ea9d34")
                           ("rose"           . "#d7827e")
                           ("pine"           . "#286983")
                           ("foam"           . "#56949f")
                           ("iris"           . "#907aa9")
                           ("highlight-low"  . "#f4ede8")
                           ("highlight-med"  . "#dfdad9")
                           ("highlight-high" . "#cecacd")))

;;;; Fonts

(defun set-face (face style)
  "Reset a face and make it inherit style."
  (set-face-attribute face nil
   :foreground 'unspecified :background 'unspecified
   :family     'unspecified :slant      'unspecified
   :weight     'unspecified :height     'unspecified
   :underline  'unspecified :overline   'unspecified
   :box        'unspecified :inherit    style))

(set-face-attribute 'default nil :family "Iosevka" :height 120)

(set-face 'fixed-pitch    'default)
(set-face 'variable-pitch 'default)

;;;; Lisp mode

(defun aru/emacs-lisp-mode-hook ()
  (setq indent-tabs-mode nil))

(add-hook 'emacs-lisp-mode-hook #'aru/emacs-lisp-mode-hook)

;;;; Useful functions

(defun aru/align-multiline-setq ()
  (interactive)
  (align-regexp (region-beginning)
                (region-end)
                "^\\([[:graph:]]+ \\| +\\)[[:graph:]]+\\(\\s-*\\) "
                2
                0))

(defun aru/align-multiline-alist ()
  (interactive)
  (align-regexp (region-beginning)
                (region-end)
                "\\(\\s-*\\) \\."
                1
                0))
