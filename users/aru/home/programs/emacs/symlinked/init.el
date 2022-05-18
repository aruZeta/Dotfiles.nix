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

(setq backup-by-copying   t
      version-control     t
      delete-old-versions t
      kept-new-versions   20
      kept-old-versions   5
      backup-directory-alist
      `(("." . ,(concat nix/xdg-config-home "/emacs/backup"))))

;;;; Elcord

(setq elcord-refresh-rate 5)

(elcord-mode)

;;;; Syntax tables

(modify-syntax-entry ?_ "w") ; Make _ part of a word

;;;; Magit

(setq magit-diff-highlight-trailing       t
      magit-diff-paint-whitespace         t
      magit-diff-refine-ignore-whitespace nil
      magit-diff-refine-hunk              'all)

;;;; General config for programming

(setq-default indent-tabs-mode nil)

;;;; Lsp

(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(add-hook 'lsp-mode-hook #'flycheck-mode)
(add-hook 'lsp-mode-hook #'lsp-treemacs-sync-mode)

;;;; Company

(add-hook 'after-init-hook #'global-company-mode)

;;;; Yasnippet

(add-hook 'after-init-hook #'yas-global-mode)

;;;; Sbcl

(setq inferior-lisp-program "sbcl")

;;;; Web mode

(defun aru/web-mode-hook ()
  (setq tab-width 2))

(add-hook 'web-mode-hook #'lsp)
(add-hook 'web-mode-hook #'emmet-mode)
(add-hook 'web-mode-hook #'aru/web-mode-hook)

;;;; Emmet

(setq emmet-self-closing-tag-style     " /"
      emmet-move-cursor-between-quotes t)

(with-eval-after-load 'emmet
  (aru/emmet-mode-setup))

;;;; Nxml mode

(setq nxml-attribute-indent 2)

(defun aru/nxml-mode-hook ()
  (setq tab-width 2))

(add-hook 'nxml-mode-hook #'lsp)
(add-hook 'nxml-mode-hook #'aru/nxml-mode-hook)

;;;; Lua

(setq lua-indent-level 4)

;;;; Java

(defun aru/java-mode-hook ()
  (setq tab-width        4))
(add-hook 'java-mode-hook #'lsp)
(add-hook 'java-mode-hook #'aru/java-mode-hook)

;;;; Visual fill

(defun aru/visual-fill (&optional width)
  (setq visual-fill-column-width (or width 80)
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;;;; Org

(setq org-directory                    nix/xdg-org-dir
      org-ellipsis                     " ▾"
      org-startup-folded               t
      org-startup-indented             t
      org-list-allow-alphabetical      t
      org-edit-src-content-indentation 0)

(setq org-html-head-include-default-style nil
      org-html-htmlize-output-type        'css
      org-html-html5-fancy                t
      org-html-doctype                    "html5"
      org-html-checkbox-type              'unicode
      org-export-allow-bind-keywords      t)

(add-hook 'org-mode-hook #'org-superstar-mode)
(add-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'aru/visual-fill)

(with-eval-after-load 'org
  (aru/plantuml-org-mode-setup)
  (aru/shell-org-mode-setup))

;;;; Org superstar

(setq org-superstar-headline-bullets-list '("◉" "◈" "⬠" "⬡" "○"))

;;;; Plantuml

(setq plantuml-executable-path   (getenv "PLANTUML_BIN")
      plantuml-default-exec-mode 'executable)

(defun aru/plantuml-org-mode-setup ()
  (setq org-plantuml-executable-path (getenv "PLANTUML_BIN")
        org-plantuml-exec-mode       'plantuml)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((plantuml . t))))

;;;; Shell

(defun aru/shell-org-mode-setup ()
(org-babel-do-load-languages 'org-babel-load-languages
                             '((shell . t))))

;;;; Nix

(add-to-list 'auto-mode-alist '("\\.nix?\\'" . nix-mode))

;;;; Lisp

(add-hook 'lisp-mode-hook #'lispy-mode)

;;;; Emacs lisp

(add-hook 'emacs-lisp-mode-hook #'lispy-mode)

;;;; Latex

(setq org-format-latex-options
      '(:foreground "#8ec07c"
                    :background default
                    :scale 1.0
                    :html-foreground "Black"
                    :html-background "Transparent"
                    :html-scale 1.0
                    :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))

;;;; Web server

(defvar *aru/web-server-ports-opened* '())
(defvar *aru/web-server-port-default* 8000)

(defun aru/web-server-add-opened-port (name port)
  (push (cons name port) *aru/web-server-ports-opened*))

(defun aru/web-server-remove-opened-port (name)
  (let ((name-port-cons (assoc name *aru/web-server-ports-opened*)))
    (setq *aru/web-server-ports-opened*
          (delq name-port-cons *aru/web-server-ports-opened*))
    (cdr name-port-cons)))

(defun aru/web-server-get-new-port ()
  (require 'dash)
  (if (length= *aru/web-server-ports-opened* 0)
      *aru/web-server-port-default*
    (1+ (cdr (--max-by (> (cdr it) (cdr other))
                       *aru/web-server-ports-opened*)))))

(defun aru/web-server-get-name ()
  (format "web-server-%s" (projectile-project-name)))

(defun aru/web-server-open ()
  (interactive)
  (let ((name (aru/web-server-get-name)))
    (if (get-process name)
        (message "Web server already started in this project.")
      (aru/web-server--open name))))

(defun aru/web-server--open (name)
  (let* ((port (aru/web-server-get-new-port))
         (cmd (format "python3 -m http.server --directory %s %d"
                      (projectile-project-root)
                      port))
         (buffer-name (format "*%s*" name)))
    (start-process-shell-command name buffer-name cmd)
    (aru/web-server-add-opened-port name port)
    (message "Web server started on port %d" port)))

(defun aru/web-server-kill ()
  (interactive)
  (let* ((name (aru/web-server-get-name))
         (process (get-process name)))
    (if process
        (aru/web-server--kill process name)
      (message "Can't stop what isn't started."))))

(defun aru/web-server--kill (process name)
  (delete-process process)
  (message "Web server on port %d closed."
           (aru/web-server-remove-opened-port name)))

;;;; Pinentry

(pinentry-start)

;;;; Mu4e

(setq auth-source-debug                   t
      auth-source-do-cache                nil
      auth-source-pass-filename           nix/xdg-keys-dir
      auth-sources                        '(password-store)
      mail-user-agent                     'mu4e-user-agent
      message-send-mail-function          'smtpmail-send-it
      mml-secure-openpgp-sign-with-sender t
      mu4e-attachment-dir                 nix/xdg-mail-dir
      mu4e-compose-signature              "Alberto (a.k.a. aru)"
      mu4e-compose-signature-auto-include t
      mu4e-drafts-folder                  "/Drafts"
      mu4e-get-mail-command               "mbsync aru"
      mu4e-refile-folder                  "/Archive"
      mu4e-sent-folder                    "/Sent"
      mu4e-sent-messages-behavior         'sent
      mu4e-trash-folder                   "/Trash"
      mu4e-update-interval                60
      mu4e-use-fancy-chars                t
      smtpmail-smtp-server                "smtp.zoho.eu"
      smtpmail-smtp-service               465
      smtpmail-smtp-user                  "aru_hackZ.official@zohomail.eu"
      smtpmail-stream-type                'ssl
      mml-secure-key-preferences
      '((OpenPGP
         (sign ("aru_hackZ.official@zohomail.eu"
                "D7D93ECFDA731BE3159F6BD93A581BDE765C0DFA"))
         (encrypt ("aru_hackZ.official@zohomail.eu"
                   "D7D93ECFDA731BE3159F6BD93A581BDE765C0DFA")))))

(auth-source-pass-enable)
(mu4e-alert-set-default-style 'libnotify)

(mu4e)

(add-hook 'message-send-hook #'mml-secure-message-sign-pgpmime)
(add-hook 'mu4e-mode-hook #'mu4e-alert-enable-notifications)
(add-hook 'mu4e-mode-hook #'mu4e-alert-enable-mode-line-display)
