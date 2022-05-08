(setq user-full-name    "Alberto Robles Gomez"
      user-mail-address "aru_hackZ.official@zohomail.eu")
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)
(set-fringe-mode 10)
(column-number-mode)
(global-display-line-numbers-mode t)

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                slime-repl-mode-hook
                treemacs-mode-hook
                mu4e-main-mode-hook
                mu4e-headers-mode-hook
                mu4e-view-mode-hook
                mu4e-compose-mode-hook
                mu4e-org-mode-hook
                mu4e~update-mail-mode-hook
                mu4e-loading-mode-hook))
        (add-hook mode (lambda () (display-line-numbers-mode 0))))
(custom-set-variables
 '(inhibit-startup-screen t)
 '(initial-buffer-choice t))
(set-face-attribute 'default nil :font "Iosevka" :height 120)
(set-face-attribute 'fixed-pitch nil :font "Iosevka" :height 120)
(set-face-attribute 'variable-pitch nil :font "Iosevka" :height 120)
(load-theme 'gruvbox-dark-hard t)
(ivy-mode 1)
(ivy-rich-mode 1)
(all-the-icons-ivy-rich-mode)
(counsel-mode 1)
(require 'all-the-icons)
(doom-modeline-mode 1)
(setq doom-modeline-height 30)
(require 'svg-tag-mode)
(setq svg-tag-tags
      '((":TODO:" . aru/org-svg-tag-todo)
        ("#\\+[a-zA-Z]+:" . aru/org-svg-tag-settings)))
(defface aru/face-org-svg-tag-todo
  '((t :foreground "#98971a"
       :background "#282828"
       :box        (:line-width 1 :color "#98971a" :style nil)
       :weight     bold
       :family     unspecified
       :inherit    default))
  "Face for todo svg tags"
  :group nil)

(defface aru/face-org-svg-tag-settings
  '((t :foreground "#7c6f64"
       :background "#282828"
       :box        (:line-width 1 :color "#7c6f64" :style nil)
       :weight     bold
       :family     unspecified
       :inherit    default))
  "Face for title svg tags"
  :group nil)
; (setq aru/org-svg-tag-todo
;       (svg-tag-make "TODO" 'aru/face-org-svg-tag-todo 2 0 5))

; (defun aru/org-svg-tag-settings (text)
;   (svg-tag-make (substring text 2 -1) 'aru/face-org-svg-tag-settings 2 0 5))
(setq which-key-idle-delay .5)
(which-key-mode)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(defun aru/diff-faces ()
  (set-face-attribute 'diff-refine-removed nil
		      :background "#252122"
		      :foreground "#fb4934")
  (set-face-attribute 'diff-refine-added nil
		      :background "#212421"
		      :foreground "#98971a"))
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(modify-syntax-entry ?_ "w")
(setq evil-want-keybinding nil)
(evil-mode 1)
(evil-collection-init)

(setq evil-collection-outline-bind-tab-p t
      evil-collection-calendar-want-org-bindings t
      evil-collection-setup-minibuffer t)
(setq general-override-states '(insert
                                emacs
                                hybrid
                                normal
                                visual
                                motion
                                operator
                                replace))
(general-define-key
 :states '(normal visual motion)
 :keymaps 'override
 :prefix "SPC"
 :non-normal-prefix "M-<return>"

 ; Treemacs
 "t" '(:ignore t :which-key "Treemacs")

 "t t" '(treemacs :which-key "Toggle treemacs sidebar")

 ; Buffer
 "b" '(:ignore t :which-key "Buffer")

 "b <right>" '(switch-to-next-buffer :which-key "Next")
 "b <left>" '(switch-to-prev-buffer :which-key "Previous")
 "b s" '(switch-to-buffer :which-key "Select")
 "b w" '(switch-to-buffer-other-window :which-key "Select to other window")

 "b k" '(:ignore t :which-key "Kill")
 "b k o" '(kill-buffer :which-key "Other")
 "b k f" '(kill-current-buffer :which-key "Focused")

 ; Window
 "w" '(:ignore t :which-key "Window")

 "w <up>" '(windmove-up :which-key "Top")
 "w <right>" '(windmove-right :which-key "Right")
 "w <down>" '(windmove-down :which-key "Bottom")
 "w <left>" '(windmove-left :which-key "Left")

 "w s" '(:ignore t :which-key "Split")
 "w s <right>" '(split-window-right :which-key "Right")
 "w s <down>" '(split-window-below :which-key "Below")

 "w d" '(:ignore t :which-key "Delete")
 "w d o" '(delete-other-window :which-key "Other")
 "w d f" '(delete-window :which-key "Focused")
 "w d <up>" '(windmove-delete-up :which-key "Top")
 "w d <right>" '(windmove-delete-right :which-key "Right")
 "w d <down>" '(windmove-delete-down :which-key "Bottom")
 "w d <left>" '(windmove-delete-left :which-key "Left")

 ; Web server
 "C-w" '(:ignore t :which-key "Web server")
 "C-w o" '(aru/web-server-open :which-key "Open web server")
 "C-w k" '(aru/web-server-kill :which-key "Kill current web server")

 ; Magit
 "m" '(magit :which-key "Magit")

 ; Mu4e (Email)
 "e" '(mu4e :which-key "Mu4e")

 ; Terminal
 "v" '(vterm :which-key "Terminal"))
(setq org-directory "~/Archive/Org/"

      org-ellipsis " ▾"

      org-priority-default 5
      org-priority-highest 1
      org-priority-lowest 5

      org-startup-folded t
      org-startup-indented t

      org-list-allow-alphabetical t

      org-edit-src-content-indentation 0

      org-todo-keywords '((sequencep "TODO(t)"
                                     "NEXT(n)"
                                     "|"
                                     "DONE(d)"
                                     "CANCELED(x)"))

      org-fancy-priorities-list '((?1 . "➀")
                                  (?2 . "➁")
                                  (?3 . "➂")
                                  (?4 . "➃")
                                  (?5 . "➄"))

      org-priority-faces '((?1 . (:foreground "#cc241d" :weight extrabold))
                           (?2 . (:foreground "#d65d0e" :weight bold))
                           (?3 . (:foreground "#d79921" :weight semibold))
                           (?4 . (:foreground "#98971a"))
                           (?5 . (:foreground "#689d6a"))))
(defun aru/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))
(setq org-agenda-fontify-priorities t
      org-agenda-hide-tags-regexp "."

      org-agenda-files '("~/Archive/Org/inbox.org"
                         "~/Archive/Org/agenda.org"
                         "~/Archive/Org/notes.org"
                         "~/Archive/Org/projects.org")

      org-agenda-prefix-format '((agenda . " %i %-12:c%?-12t% s")
                                 (todo   . " ")
                                 (tags   . " %i %-12:c")
                                 (search . " %i %-12:c"))

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
(advice-add 'org-agenda-quit :before
            (lambda (&rest _)
              (org-save-all-org-buffers)))
(setq org-capture-templates
      '(("i" "Inbox" entry (file "~/Archive/Org/inbox.org")
         "* TODO %?\n/Entered on/ %U")
        ("m" "Meeting" entry (file+headline "~/Archive/Org/agenda.org" "Future")
         "* %? :meeting:\n<%<%Y-%m-%d %a %H:00>>")
        ("n" "Note" entry (file "~/Archive/Org/notes.org")
         "* NOTE (%a)\n/Entered on/ %U/n/n%?")
        ("@" "Inbox [mu4e]" entry (file "~/Archive/Org/inbox.org")
         "* TODO Reply to \"%a\" %?\n/Entered on/ %U")))
(setq org-refile-targets '(("~/Documents/ORG/projects.org"
                      :regexp . "\\(?:\\(?:Note\\|Task\\)s\\)")))
(advice-add 'org-refile :before
            (lambda (&rest _)
              (org-save-all-org-buffers)))
(setq org-log-done 'time)
(defun aru/log-todo-next-creation-date (&rest _)
  "Log NEXT creation time inthe property drawer under the key 'ACTIVATED'"
  (when (and (string= (org-get-todo-state) "NEXT")
             (not (org-entry-get nil "ACTIVATED")))
        (org-entry-put nil "ACTIVATED" (format-time-string "[%Y-%m-%d %H:%M]"))))
(add-hook 'org-after-todo-state-change-hook #'aru/log-todo-next-creation-date)
(setq org-html-head-include-default-style nil
      org-html-htmlize-output-type 'css
      org-html-html5-fancy t
      org-html-doctype "html5"
      org-html-checkbox-type 'unicode
      org-export-allow-bind-keywords t)
(defun aru/org-scss-generation (plist filename pub-dir)
  (let* ((visiting (find-buffer-visiting filename))
         (scss-buffer (or visiting (find-file-noselect filename))))
    (with-current-buffer scss-buffer
      (compile (concat "sass -t compressed --update"
                       " "
                       filename
                       ":"
                       (org-export-output-file-name ".css" nil pub-dir))))
    (unless visiting (kill-buffer scss-buffer))))
(with-eval-after-load 'org-element
  (defun org-element-plain-list-parser (limit affiliated structure)
    "Parse a plain list.

LIMIT bounds the search.  AFFILIATED is a list of which CAR is
the buffer position at the beginning of the first affiliated
keyword and CDR is a plist of affiliated keywords along with
their value.  STRUCTURE is the structure of the plain list being
parsed.

Return a list whose CAR is `plain-list' and CDR is a plist
containing `:type', `:begin', `:end', `:contents-begin' and
`:contents-end', `:structure', `:post-blank' and
`:post-affiliated' keywords.

Assume point is at the beginning of the list."
    (save-excursion
      (let* ((struct (or structure (org-element--list-struct limit)))
             (ol-alpha nil)
             (type (cond ((looking-at-p "[ \t]*[a-z]")
                          (setq ol-alpha 'lower) 'ordered)
                         ((looking-at-p "[ \t]*[A-Z]")
                          (setq ol-alpha 'upper) 'ordered)
                         ((looking-at-p "[ \t]*[0-9]") 'ordered)
                         ((nth 5 (assq (point) struct)) 'descriptive)
                         (t 'unordered)))
             (contents-begin (point))
             (begin (car affiliated))
             (contents-end (let* ((item (assq contents-begin struct))
                                  (ind (nth 1 item))
                                  (pos (nth 6 item)))
                             (while (and (setq item (assq pos struct))
                                         (= (nth 1 item) ind))
                               (setq pos (nth 6 item)))
                             pos))
             (end (progn (goto-char contents-end)
                         (skip-chars-forward " \r\t\n" limit)
                         (if (= (point) limit) limit (line-beginning-position)))))
        ;; Return value.
        (list 'plain-list
              (nconc
               (list :type type
                     :ol-alpha ol-alpha
                     :begin begin
                     :end end
                     :contents-begin contents-begin
                     :contents-end contents-end
                     :structure struct
                     :post-blank (count-lines contents-end end)
                     :post-affiliated contents-begin)
               (cdr affiliated)))))))

(with-eval-after-load 'ox-html
  (defun org-html-plain-list (plain-list contents _info)
    "Transcode a PLAIN-LIST element from Org to HTML.
CONTENTS is the contents of the list.  INFO is a plist holding
contextual information."
    (let* ((alpha nil)
           (type (pcase (org-element-property :type plain-list)
                   (`ordered (pcase (org-element-property :ol-alpha plain-list)
                               (`lower (setq alpha "lower-alpha"))
                               (`upper (setq alpha "upper-alpha")))
                             "ol")
                   (`unordered "ul")
                   (`descriptive "dl")
                   (other (error "Unknown HTML list type: %s" other))))
           (class (format "org-%s" type))
           (attributes (org-export-read-attribute :attr_html plain-list)))
      (format "<%s %s>\n%s</%s>"
              type
              (org-html--make-attribute-string
               (plist-put attributes :class
                          (org-trim
                           (mapconcat #'identity
                                      (list class alpha (plist-get attributes :class))
                                      " "))))
              contents
              type))))
(defun aru/org-export-delete-special-cols-n-rows (back-end)
   (while (re-search-forward "^[ \t]*| +\\(<_>\\) +|" nil t)
          (goto-char (match-beginning 1))
          (org-table-kill-row)
          (beginning-of-line))
   (beginning-of-buffer)
   (while (re-search-forward "| +\\(<~>\\) +|" nil t)
          (goto-char (match-beginning 1))
          (org-table-delete-column)
          (beginning-of-line)))
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
(add-hook 'org-export-before-processing-hook
          #'aru/org-export-delete-special-cols-n-rows)
(defun aru/org-faces ()
  (dolist (face '((org-document-title . 1.5)
                  (org-level-1 . 1.4)
                  (org-level-2 . 1.25)
                  (org-level-3 . 1.1)
                  (org-level-4 . 1.1)
                  (org-level-5 . 1.1)
                  (org-level-6 . 1.05)
                  (org-level-7 . 1.05)))
    (set-face-attribute (car face) nil :font "Iosevka" :height (cdr face))))
(setq org-superstar-headline-bullets-list '("◉" "◈" "⬠" "⬡" "○"))
(defun aru/org-hook ()
  (set-face-attribute 'org-ellipsis nil :underline nil)
  (org-superstar-mode 1)
  (turn-on-auto-fill)
  (aru/org-faces)
  (aru/org-mode-visual-fill)
  (aru/org-plantuml-mode-hook)
  (aru/org-shell-mode-hook))
(defun aru/org-src-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'org-mode-hook #'aru/org-hook)
(add-hook 'org-src-mode-hook #'aru/org-src-hook)
(defun aru/org-plantuml-mode-hook ()
  (setq org-plantuml-executable-path (getenv "PLANTUML_BIN"))
  (setq org-plantuml-exec-mode 'plantuml)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

(setq plantuml-executable-path (getenv "PLANTUML_BIN"))
(setq plantuml-default-exec-mode 'executable)
(defun aru/org-shell-mode-hook ()
  (org-babel-do-load-languages 'org-babel-load-languages '((shell . t))))
(setq org-format-latex-options '(:foreground "#8ec07c"
                                 :background default
                                 :scale 1.0
                                 :html-foreground "Black"
                                 :html-background "Transparent"
                                 :html-scale 1.0
                                 :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
(require 'mu4e)
(pinentry-start)
(setq mu4e-refile-folder "/Archive"
      mu4e-drafts-folder "/Drafts"
      mu4e-sent-folder "/Sent"
      mu4e-trash-folder "/Trash"
      mu4e-compose-signature "Alberto (a.k.a. aru)"
      mu4e-compose-signature-auto-include t
      mu4e-use-fancy-chars t
      mu4e-get-mail-command "mbsync aru"
      mu4e-update-interval 60
      mu4e-sent-messages-behavior 'sent

      mail-user-agent 'mu4e-user-agent

      message-send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.zoho.eu"
      smtpmail-smtp-service 465
      smtpmail-smtp-user "aru_hackZ.official@zohomail.eu"
      smtpmail-stream-type 'ssl)
(auth-source-pass-enable)

(setq auth-source-debug t
      auth-source-do-cache nil
      auth-sources '(password-store))
(setq mml-secure-key-preferences
      '((OpenPGP
         (sign ("aru_hackZ.official@zohomail.eu"
                "D7D93ECFDA731BE3159F6BD93A581BDE765C0DFA"))
         (encrypt ("aru_hackZ.official@zohomail.eu"
                   "D7D93ECFDA731BE3159F6BD93A581BDE765C0DFA"))))
      mml-secure-openpgp-sign-with-sender t)
(mu4e-alert-set-default-style 'libnotify)
(add-hook 'after-init-hook #'mu4e-alert-enable-notifications)
(add-hook 'after-init-hook #'mu4e-alert-enable-mode-line-display)
(add-hook 'message-send-hook #'mml-secure-message-sign-pgpmime)
(add-hook 'lsp-mode-hook #'lsp-ui-mode)
(add-hook 'lsp-mode-hook #'flycheck-mode)
(add-hook 'lsp-mode-hook #'dap-mode)
(lsp-treemacs-sync-mode 1)
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")
(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)
(projectile-mode +1)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.nix?\\'" . nix-mode))
(defun aru/web-mode-hook ()
  (setq indent-tabs-mode t
        tab-width        2)
  (web-mode-use-tabs)
  (global-set-key (kbd "C-SPC") 'emmet-expand-line)
  (add-hook 'after-save-hook #'aru/scss-compile-maybe))
(add-hook 'web-mode-hook #'lsp)
(add-hook 'web-mode-hook #'emmet-mode)
(add-hook 'web-mode-hook #'aru/web-mode-hook)
(add-to-list 'lsp-language-id-configuration '(".*\\.scss" . "scss"))
(defcustom aru/do-compile-scss nil
  "Wanna compile scss?"
  :type 'boolean)

(defcustom aru/scss-sass-options '()
  "Scss compile options"
  :type '(repeat string))

(defcustom aru/scss-output-directory nil
  "Output directory for compiled files"
  :type '(choice (const :tag "Same dir" nil)
                 (string :tag "Relative dir")))
(defun aru/scss-compile ()
  (interactive)
  (compile (concat "sass"
                   " "
                   (mapconcat 'identity aru/scss-sass-options " ")
                   " --update "
                   (when (string-match ".*/" buffer-file-name)
                     (concat "'" (match-string 0 buffer-file-name) "'"))
                   (when aru/scss-output-directory
                     (concat ":'" aru/scss-output-directory "'")))))
(defun aru/is-scss-file ()
  (interactive)
  (if (string=
       (file-name-extension (buffer-file-name (window-buffer (minibuffer-selected-window))))
       "scss")
      t nil))
(defun aru/scss-compile-maybe ()
  (if (and (aru/is-scss-file)
           aru/do-compile-scss)
      (aru/scss-compile)))
(defun aru/emmet-mode-hook ()
  (setq emmet-self-closing-tag-style " /"
        emmet-move-cursor-between-quotes t))
(add-hook 'emmet-mode-hook #'aru/emmet-mode-hook)
(defun aru/java-mode-hook ()
  (setq indent-tabs-mode t
        tab-width        4))
(add-hook 'java-mode-hook #'lsp)
(add-hook 'java-mode-hook #'aru/java-mode-hook)
(setq lua-indent-level 4)
(defun aru/lua-mode-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'lua-mode-hook #'aru/lua-mode-hook)
(defun aru/elisp-mode-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'emacs-lisp-mode-hook #'aru/elisp-mode-hook)
(defun aru/lisp-mode-hook ()
  (setq indent-tabs-mode nil))
(add-hook 'lisp-mode-hook #'aru/lisp-mode-hook)
(setq magit-diff-highlight-trailing t
      magit-diff-paint-whitespace t
      magit-diff-refine-ignore-whitespace nil
      magit-diff-refine-hunk 'all)
(add-hook 'magit-mode-hook #'aru/diff-faces)
(add-hook 'after-init-hook #'global-company-mode)
(setq inferior-lisp-program "sbcl")
(add-hook 'after-init-hook #'yas-global-mode)
(defun aru/check-closing-paren ()
  (interactive "*")
  (if (= (char-after) ?\))
      (forward-char)
    (insert ")")))
(general-define-key
 :states '(insert)
 :keymaps '(lisp-mode-map emacs-lisp-mode-map)
 "(" 'lispy-parens
 ")" 'aru/check-closing-paren)
(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))

(add-hook 'nxml-mode-hook 'hs-minor-mode)

;; optional key bindings, easier than hs defaults
(define-key nxml-mode-map (kbd "C-c C-f") 'hs-toggle-hiding)
(setq nxml-attribute-indent 2)
(defun aru/nxml-mode-hook ()
  (setq indent-tabs-mode t
        tab-width        2)
  (global-set-key (kbd "C-SPC") #'emmet-expand-line))
(add-hook 'nxml-mode-hook #'aru/nxml-mode-hook)
(add-hook 'nxml-mode-hook #'lsp)
(add-hook 'nxml-mode-hook #'emmet-mode)
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
(setq backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 20
      kept-old-versions 5)
(require 'elcord)
(elcord-mode)

(setq elcord-refresh-rate 5)
