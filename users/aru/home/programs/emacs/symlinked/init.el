;;;; Loading stuff

(add-to-list 'load-path (concat user-emacs-directory "my-libs"))
(setq custom-theme-directory (concat user-emacs-directory "my-libs"))

(require 'nix/expanded)

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

;;;; General

(setq general-override-states '(insert
                                emacs
                                hybrid
                                normal
                                visual
                                motion
                                operator
                                replace))

;;; Keys

(general-define-key
 :states '(normal visual motion)
 :keymaps 'override
 :prefix "SPC"
 :non-normal-prefix "M-<return>"

 ;; Treemacs
 "t"           '(:ignore t :which-key "Treemacs")
 "t t"         '(treemacs :which-key "Toggle treemacs sidebar")

 ;; Buffer
 "b"           '(:ignore t :which-key "Buffer")
 "b <right>"   '(switch-to-next-buffer :which-key "Next")
 "b <left>"    '(switch-to-prev-buffer :which-key "Previous")
 "b s"         '(switch-to-buffer :which-key "Select")
 "b w"         '(switch-to-buffer-other-window :which-key "Select to other window")
 "b k"         '(:ignore t :which-key "Kill")
 "b k o"       '(kill-buffer :which-key "Other")
 "b k f"       '(kill-current-buffer :which-key "Focused")

 ;; Window
 "w"           '(:ignore t :which-key "Window")
 "w <up>"      '(windmove-up :which-key "Top")
 "w <right>"   '(windmove-right :which-key "Right")
 "w <down>"    '(windmove-down :which-key "Bottom")
 "w <left>"    '(windmove-left :which-key "Left")
 "w s"         '(:ignore t :which-key "Split")
 "w s <right>" '(split-window-right :which-key "Right")
 "w s <down>"  '(split-window-below :which-key "Below")
 "w d"         '(:ignore t :which-key "Delete")
 "w d o"       '(delete-other-window :which-key "Other")
 "w d f"       '(delete-window :which-key "Focused")
 "w d <up>"    '(windmove-delete-up :which-key "Top")
 "w d <right>" '(windmove-delete-right :which-key "Right")
 "w d <down>"  '(windmove-delete-down :which-key "Bottom")
 "w d <left>"  '(windmove-delete-left :which-key "Left")

 ;; Web server
 "C-w"         '(:ignore t :which-key "Web server")
 "C-w o"       '(aru/web-server-open :which-key "Open web server")
 "C-w k"       '(aru/web-server-kill :which-key "Kill current web server")

 ;; Magit
 "m"           '(magit :which-key "Magit")

 ;; Mu4e (Email)
 "e"           '(mu4e :which-key "Mu4e")

 ;; Terminal
 "v"           '(vterm :which-key "Terminal"))

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

;;;; Themes

(load-theme 'aru/themes/rose-pine-dawn t)

;;;; Useful functions

(defun aru/align-multiline-setq ()
  (interactive)
  (align-regexp (region-beginning)
                (region-end)
                "^\\([[:graph:]]+ \\| +\\)[[:graph:]]+\\(\\s-*\\) "
                2
                0))

(defun aru/align-multiline-2nd-space ()
  (interactive)
  (align-regexp (region-beginning)
                (region-end)
                "^\\s-*[[:graph:]]+ [[:graph:]]+\\(\\s-*\\) "
                1
                0))

(defun aru/align-multiline-alist ()
  (interactive)
  (align-regexp (region-beginning)
                (region-end)
                "\\(\\s-*\\) \\."
                1
                0))

;;;; Backup

(setq backup-directory-alist
      `(("." . ,(concat nix/xdg-config-home "/emacs/backup"))))

;;;; Syntax tables

(modify-syntax-entry ?_ "w") ; Make _ part of a word

;;;; General config for programming

(setq-default indent-tabs-mode nil)
