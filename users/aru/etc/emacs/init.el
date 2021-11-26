;;; Emacs Config

(setq inhibit-startup-message t
      user-full-name "Alberto Robles Gomez"
      user-mail-address "aru_hackZ.official@zohomail.eu"
      which-key-idle-delay 2)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(counsel-mode 1)
(ivy-mode 1)
(ivy-rich-mode 1)
(evil-mode 1)
(lsp-treemacs-sync-mode 1)

(projectile-mode +1)

(global-display-line-numbers-mode t)

(set-fringe-mode 10)

(column-number-mode)
(which-key-mode)

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook))
        (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "Iosevka Term" :height 120)

(load-theme 'gruvbox-dark-hard)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((java . t)))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.nix?\\'" . nix-mode))

(add-to-list 'lsp-language-id-configuration '(".*\\.scss" . "scss"))

(defun aru/web-mode-hook ()
  (setq indent-tabs-mode t
	tab-width        2)
  (web-mode-use-tabs)
  (global-set-key (kbd "C-SPC") 'emmet-expand-line)
  (add-hook 'after-save-hook #'aru/scss-compile-maybe))

(setq aru/scss-sass-options '()
      aru/scss-output-directory nil)

(defun aru/scss-compile ()
  (interactive)
  (compile (concat "sass" " " (mapconcat 'identity aru/scss-sass-options " ") " --update "
                   (when (string-match ".*/" buffer-file-name)
                     (concat "'" (match-string 0 buffer-file-name) "'"))
                   (when aru/scss-output-directory
                     (concat ":'" aru/scss-output-directory "'")))))

(defun aru/emmet-mode-hook ()
  (setq emmet-self-closing-tag-style " /"
	emmet-move-cursor-between-quotes t))

(defun aru/is-scss-file ()
  (interactive)
  (if (string=
       (file-name-extension (buffer-file-name (window-buffer (minibuffer-selected-window))))
       "scss")
      t nil))

(defun aru/scss-compile-maybe ()
  (if (aru/is-scss-file) (aru/scss-compile)))

;;; Hooks Config

(add-hook 'lsp-mode #'lsp-ui-mode)
(add-hook 'lsp-mode #'flycheck-mode)

(add-hook 'java-mode-hook #'lsp)

(add-hook 'web-mode-hook #'lsp)
(add-hook 'web-mode-hook #'emmet-mode)
(add-hook 'web-mode-hook #'aru/web-mode-hook)

(add-hook 'org-after-todo-state-change-hook #'aru/log-todo-next-creation-date)
(add-hook 'org-mode-hook                    #'aru/org-hook)
(add-hook 'org-mode-hook                    #'turn-on-auto-fill)

(add-hook 'emmet-mode-hook #'aru/emmet-mode-hook)

;;; Keybindings config

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
; (define-key lsp-mode-map (kbd "TAB") 'completion-at-point)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(general-define-key
 :states '(normal)
 :prefix "SPC"
 :non-normal-prefix "M-<return>"

 ; Treemacs
 "t" '(:ignore t :which-key "Treemacs")

 "t t" '(treemacs :which-key "Toggle treemacs sidebar")

 ; Magit
 "m" '(magit :which-key "Magit"))

;;; Org config

(setq org-agenda-fontify-priorities t
      org-agenda-hide-tags-regexp "."
      org-directory "~/Archive/Org/"
      org-ellipsis " ▾"
      org-html-head-include-default-style nil
      org-html-htmlize-output-type 'css
      org-html-html5-fancy t
      org-html-doctype "html5"
      org-log-done 'time
      org-priority-default 5
      org-priority-highest 1
      org-priority-lowest 5
      org-startup-folded t
      org-startup-indented t

      org-publish-project-alist
      '(("S1DAM - Notes" :components ("S1DAM_Notes.org" "S1DAM_Notes.static"))
	("S1DAM_Notes.org"
         :headline-levels 6
         :recursive t
         :base-extension "org"
         :base-directory "~/Archive/Classes/S1DAM/Notes.org/"
         :publishing-directory "~/Archive/Classes/S1DAM/Notes/"
         :publishing-function org-html-publish-to-html)
	("S1DAM_Notes.static"
         :recursive t
         :base-extension "css\\|png\\|eot\\|woff2\\|woff\\|ttf\\|svg"
         :base-directory "~/Archive/Classes/S1DAM/Notes.org/"
         :publishing-directory "~/Archive/Classes/S1DAM/Notes/"
         :publishing-function org-publish-attachment))

      org-todo-keywords '((sequencep "TODO(t)"
                                     "NEXT(n)"
				     "|"
				     "DONE(d)"
				     "CANCELED(x)"))

      org-agenda-files '("~/Archive/Org/inbox.org"
			 "~/Archive/Org/agenda.org"
			 "~/Archive/Org/notes.org"
			 "~/Archive/Org/projects.org")

      org-fancy-priorities-list '((?1 . "➀")
                                  (?2 . "➁")
                                  (?3 . "➂")
                                  (?4 . "➃")
                                  (?5 . "➄"))

      org-capture-templates
      '(("i" "Inbox" entry (file "~/Archive/Org/inbox.org")
         "* TODO %?\n/Entered on/ %U")
	("m" "Meeting" entry (file+headline "~/Archive/Org/agenda.org" "Future")
	 "* %? :meeting:\n<%<%Y-%m-%d %a %H:00>>")
	("n" "Note" entry (file "~/Archive/Org/notes.org")
	 "* NOTE (%a)\n/Entered on/ %U/n/n%?")
	("@" "Inbox [mu4e]" entry (file "~/Archive/Org/inbox.org")
	 "* TODO Reply to \"%a\" %?\n/Entered on/ %U"))

      org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                 (todo   . " ")
                                 (tags   . " %i %-12:c")
                                 (search . " %i %-12:c"))

      org-refile-targets '(("~/Documents/ORG/projects.org"
                            :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)"))

      org-priority-faces '((?1 . (:foreground "#cc241d" :weight extrabold))
                           (?2 . (:foreground "#d65d0e" :weight bold))
                           (?3 . (:foreground "#d79921" :weight semibold))
                           (?4 . (:foreground "#98971a"))
                           (?5 . (:foreground "#689d6a")))

      org-agenda-custom-commands
      '(("g" "Get Things Done (GTD)"
         ((todo "NEXT"
                ((org-agenda-skip-function
                  '(org-agenda-skip-entry-if 'deadline))
                 (org-agenda-prefix-format " % i%-16 c% s[%e]: ")
                 (org-agenda-overriding-header "\nTasks\n")))
          (tags-todo "inbox"
                     ((org-agenda-prefix-format " % i%-16 c% s[%e]: ")
                      (org-agenda-overriding-header "\nInbox\n")))
          (tags-todo "projects"
                     ((org-agenda-prefix-format " % i%-16 c% s[%e]: ")
                      (org-agenda-skip-function
                       '(org-agenda-skip-entry-if 'nottodo '("TODO")))
                      (org-agenda-overriding-header "\nProjects\n")))
          (tags "CLOSED>=\"<today>\""
                ((org-agenda-prefix-format " % i%-16 c% s[%e]: ")
                 (org-agenda-overriding-header "\nCompleted today\n")))))
        ("d" "Deadlines"
          (agenda nil
                  ((org-agenda-entry-types '(:deadline))
                   (org-agenda-skip-function
                    '(org-agenda-skip-entry-if 'nottode '("NEXT")))
                   (org-agenda-format-date "")
                   (org-deadline-warning-days 7)
                   (org-agenda-overriding-header "\nDeadlines\n"))))))

(defun aru/log-todo-next-creation-date (&rest _)
  "Log NEXT creation time inthe property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
        (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d %H:%M]"))))

(advice-add 'org-refile :before
            (lambda (&rest _)
	      (org-save-all-org-buffers)))

(advice-add 'org-agenda-quit :before
            (lambda (&rest _)
	      (org-save-all-org-buffers)))

(defun aru/org-hook ()
  (set-face-attribute 'org-ellipsis nil :underline nil))

(defun aru/org-export-delete-special-cols-n-rows (back-end)
   (while (re-search-forward "^[ \t]*| +\\(_\\) +|" nil t)
          (goto-char (match-beginning 1))
          (org-table-kill-row)
          (beginning-of-line))
   (beginning-of-buffer)
   (while (re-search-forward "| +\\(<~>\\) +|" nil t)
          (goto-char (match-beginning 1))
          (org-table-delete-column)
          (beginning-of-line)))
(add-hook 'org-export-before-processing-hook #'aru/org-export-delete-special-cols-n-rows)

(defun org-html-table-cell (table-cell contents info)
  (let* ((table-cell-address (org-export-table-cell-address table-cell info))
         (table-row (org-export-get-parent table-cell))
         (table (org-export-get-parent-table table-cell))
         (cell-attrs
           (if (not (plist-get info :html-table-align-individual-fields))
               ""
               (format (if (and (boundp 'org-html-format-table-no-css)
                                org-html-format-table-no-css)
                           " align=\"%s\""
                           " class=\"org-%s\"")
                       (org-export-table-cell-alignment table-cell info)))))
    (cond
      ((or (not contents)
           (string= "" (org-trim contents)))
       "")
      ((and (org-export-table-has-header-p table info)
            (= 1 (org-export-table-row-group table-row info)))
       (let ((header-tags (plist-get info :html-table-header-tags)))
         (concat "\n"
		 (format (car header-tags) "col" cell-attrs)
                 contents
                 (cdr header-tags))))
      ((and (plist-get info :html-table-use-header-tags-for-first-column)
            (zerop (cdr (org-export-table-cell-address table-cell info))))
       (let ((header-tags (plist-get info :html-table-header-tags)))
         (concat "\n"
		 (format (car header-tags) "row" cell-attrs)
                 contents
                 (cdr header-tags))))
      (t
       (let ((data-tags (plist-get info :html-table-data-tags)))
         (concat "\n"
		 (format (car data-tags) cell-attrs)
                 contents
                 (cdr data-tags)))))))
