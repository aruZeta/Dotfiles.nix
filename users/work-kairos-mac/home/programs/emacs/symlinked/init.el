;;;; Loading stuff

(add-to-list 'load-path (concat user-emacs-directory "my-libs"))
(setq custom-theme-directory (concat user-emacs-directory "my-libs"))

;;;; User

(setq user-full-name    "Alberto Robles Gomez"
      user-mail-address "me@aruzeta.com")

;;;; Clean emacs

(setq inhibit-startup-screen  t
      initial-scratch-message nil)

(scroll-bar-mode 0)
(tool-bar-mode   0)
(tooltip-mode    0)
(menu-bar-mode   0)

;;;; Other emacs stuff

(setq gc-cons-threshold       (* 1024 1024 50) ; 50MiB
      read-process-output-max (* 1024 1024))   ; 1MiB

;;;; Evil

(setq evil-want-keybinding nil)

(evil-mode 1)
(evil-collection-init)

(setq evil-collection-outline-bind-tab-p         t
      evil-collection-calendar-want-org-bindings t
      evil-collection-setup-minibuffer           t)

;;;; Modeline

(setq column-number-mode 1)

;;;; Doom modeline

(doom-modeline-mode 1)
(setq doom-modeline-height 30)

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

 ;; Magit
 "m"           '(magit :which-key "Magit")

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

(load-theme 'aru/themes/gruvbox-dark t)

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
      `(("." . ,(concat (getenv "XDG_CONFIG_HOME") "/emacs/backup"))))

;;;; Syntax tables

(modify-syntax-entry ?_ "w") ; Make _ part of a word

;;;; Magit

(setq magit-diff-highlight-trailing       t
      magit-diff-paint-whitespace         t
      magit-diff-refine-ignore-whitespace nil
      magit-diff-refine-hunk              'all)

;;;; General config for programming

(setq-default indent-tabs-mode nil)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;;; Which key

(setq which-key-idle-delay .5)

(which-key-mode)

;;;; Lsp

(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(add-hook 'lsp-mode-hook #'flycheck-mode)
(add-hook 'lsp-mode-hook #'lsp-treemacs-sync-mode)

;;;; Ivy

(ivy-mode 1)
(ivy-rich-mode 1)
(all-the-icons-ivy-rich-mode)

;;; Lag switching buffer issue fix from
;;; https://github.com/Yevgnen/ivy-rich/issues/87#issuecomment-689581896=

(defvar ivy-rich--ivy-switch-buffer-cache
  (make-hash-table :test 'equal))

(define-advice ivy-rich--ivy-switch-buffer-transformer
    (:around (old-fn x) cache)
  (let ((ret (gethash x ivy-rich--ivy-switch-buffer-cache)))
    (unless ret
      (setq ret (funcall old-fn x))
      (puthash x ret ivy-rich--ivy-switch-buffer-cache))
    ret))

(define-advice +ivy/switch-buffer
    (:before (&rest _) ivy-rich-reset-cache)
  (clrhash ivy-rich--ivy-switch-buffer-cache))

;;; Emacs 30 bug fix from
;;; https://github.com/Yevgnen/ivy-rich/issues/115#issuecomment-1336951680

(defun ivy-rich--switch-buffer-directory! (orig-fun &rest args)
  (cl-letf (((symbol-function 'directory-file-name) #'file-name-directory))
    (apply orig-fun args)))
(advice-add 'ivy-rich--switch-buffer-directory :around #'ivy-rich--switch-buffer-directory!)

;;;; Counsel

(counsel-mode 1)

;;;; Treemacs

(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")

(defun aru/treemacs-mode-hook()
  (setq left-margin-width 1))

(add-hook 'treemacs-mode-hook  #'aru/treemacs-mode-hook)

;;;; Dired

(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)

;;;; Company

(add-hook 'after-init-hook #'global-company-mode)

;;;; Yasnippet

(add-hook 'after-init-hook #'yas-global-mode)

;;;; Visual fill

(defun aru/visual-fill (&optional width)
  (setq visual-fill-column-width (or width 80)
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;;;; Org

(setq org-directory                    (getenv "XDG_ORG_DIR")
      org-ellipsis                     " ▾"
      org-startup-folded               t
      org-startup-indented             t
      org-list-allow-alphabetical      t
      org-edit-src-content-indentation 0
      org-confirm-babel-evaluate       nil)

(setq org-html-head-include-default-style nil
      org-html-htmlize-output-type        'css
      org-html-html5-fancy                t
      org-html-doctype                    "html5"
      org-html-checkbox-type              'unicode
      org-export-allow-bind-keywords      t)

(defun aru/org/hide-meta-line ()
  (set-face 'org-meta-line 'aru/faces/wont-see))

(defun aru/org/show-meta-line ()
  (set-face 'org-meta-line 'aru/faces/not-important))

(defun aru/org/publish-project (project-path &optional org static scss)
  "Easier way to create `org-publish-project-alist' entries.
PROJECT-PATH is the path of the project.
ORG if non NIL is a PLIST with values like :headline-levels.
STATIC if non NIL is a PLIST with values like :base-extension.
SCSS if non NIL is a PLIST with values like :dir which is the project to
get the scss from.

If one of those is NIL then the component is not added, if it is T it is added
using the defaults, else using the values of the PLIST."
  (let* ((publish-dir (concat
                       (getenv "XDG_PUBLISH_DIR")
                       "/"
                       (file-name-base project-path)))
         (project-component-name (string-replace "/" "_" project-path))
         (org-component-name
          (when org (concat project-component-name ".org")))
         (static-component-name
          (when static (concat project-component-name ".static")))
         (scss-component-name
          (when scss (concat project-component-name ".scss-generation"))))
    (remove
     nil
     `((,project-path
        :components ,(remove nil `(,org-component-name
                                   ,static-component-name
                                   ,scss-component-name)))
       ,(when org
          `(,org-component-name
            :headline-levels ,(or (plist-get org :headline-levels) 6)
            :recursive t
            :base-extension "org"
            :base-directory ,project-path
            :publishing-directory ,publish-dir
            :publishing-function org-html-publish-to-html))
       ,(when static
          `(,static-component-name
            :recursive t
            :base-extension ,(or (plist-get static :base-extension) "")
            :base-directory ,project-path
            :publishing-directory ,publish-dir
            :publishing-function org-publish-attachment))
       ,(when scss
          `(,scss-component-name
            :recursive t
            :base-extension "scss"
            :base-directory ,(or (plist-get scss :dir) project-path)
            :publishing-directory ,publish-dir
            :publishing-function aru/org-scss-generation))))))

(setq org-publish-project-alist
      (append
       (aru/org/publish-project (getenv "XDG_ORG_DIR") t nil t)
       (aru/org/publish-project
        "/GitRepos/s1dam-azarquiel-2021/aru-notas-practicas"
        t
        '(:base-extension "png\\|jpg\\|jpeg\\|svg")
        `(:dir ,(getenv "XDG_ORG_DIR")))
       (aru/org/publish-project
        "/GitRepos/s2dam-azarquiel-2022/aru-sistemas-gestion"
        t
        '(:base-extension "png\\|jpg\\|jpeg\\|svg")
        `(:dir ,(getenv "XDG_ORG_DIR")))))

(add-hook 'org-mode-hook #'org-superstar-mode)
(add-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'aru/visual-fill)

(with-eval-after-load 'org
  (aru/plantuml-org-mode-setup)
  (aru/shell-org-mode-setup)
  (aru/nim-org-mode-setup))

;;;; Org superstar

(setq org-superstar-headline-bullets-list '("◉" "◈" "⬠" "⬡" "○"))

;;;; Org tree slide

(defun aru/org-tree-slide-play-setup ()
  (aru/org/hide-meta-line)
  (org-babel-result-hide-all)
  (org-display-inline-images)
  (setq org-image-actual-width '(400)
        text-scale-mode-amount 2)
  (text-scale-mode))

(defun aru/org-tree-slide-stop-setup ()
  (aru/org/show-meta-line)
  (setq text-scale-mode-amount 0)
  (text-scale-mode))

(with-eval-after-load 'org-tree-slide
  (setq org-tree-slide-activate-message "Presentation started!"
        org-tree-slide-deactivate-message "Presentation ended!"))

(add-hook 'org-tree-slide-mode-hook (apply-partially #'aru/visual-fill 90))
(add-hook 'org-tree-slide-play-hook #'aru/org-tree-slide-play-setup)
(add-hook 'org-tree-slide-stop-hook #'aru/org-tree-slide-stop-setup)

;;;; Shell

(defun aru/shell-org-mode-setup ()
(org-babel-do-load-languages 'org-babel-load-languages
                             '((shell . t))))

;;;; Nix

(add-to-list 'auto-mode-alist '("\\.nix?\\'" . nix-mode))

;;;; Direnv

(direnv-mode)
