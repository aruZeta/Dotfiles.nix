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
                "\\(\\s-*\\) \."
                1
                0))
