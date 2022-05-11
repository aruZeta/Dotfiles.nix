;;;; User

(setq user-full-name    "Alberto Robles Gomez"
      user-mail-address "aru_hackZ.official@zohomail.eu")

;;;; Evil

(setq evil-want-keybinding nil)

(evil-mode 1)
(evil-collection-init)

(setq evil-collection-outline-bind-tab-p t
      evil-collection-calendar-want-org-bindings t
      evil-collection-setup-minibuffer t)

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

