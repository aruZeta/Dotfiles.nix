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

(aru/generate-color-theme "rose-pine"
                          (("base"           . "#191724")
                           ("surface"        . "#1f1d2e")
                           ("overlay"        . "#26233a")
                           ("muted"          . "#6e6a86")
                           ("subtle"         . "#908caa")
                           ("text"           . "#e0def4")
                           ("love"           . "#eb6f92")
                           ("gold"           . "#f6c177")
                           ("rose"           . "#ebbcba")
                           ("pine"           . "#31748f")
                           ("foam"           . "#9ccfd8")
                           ("iris"           . "#c4a7e7")
                           ("highlight-low"  . "#21202e")
                           ("highlight-med"  . "#403d52")
                           ("highlight-high" . "#524f67")))

(aru/generate-color-theme "rose-pine-moon"
                          (("base"           . "#232136")
                           ("surface"        . "#2a273f")
                           ("overlay"        . "#393552")
                           ("muted"          . "#6e6a86")
                           ("subtle"         . "#908caa")
                           ("text"           . "#e0def4")
                           ("love"           . "#eb6f92")
                           ("gold"           . "#f6c177")
                           ("rose"           . "#ea9a97")
                           ("pine"           . "#3e8fb0")
                           ("foam"           . "#9ccfd8")
                           ("iris"           . "#c4a7e7")
                           ("highlight-low"  . "#2a283e")
                           ("highlight-med"  . "#44415a")
                           ("highlight-high" . "#56526e")))

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

(defgroup aru/faces nil
  "Group for faces."
  :prefix "aru/faces/"
  :group 'faces)

(defface aru/faces/very-important nil
  "Face for very important information."
  :group 'aru/faces)

(defface aru/faces/important nil
  "Face for important information."
  :group 'aru/faces)

(defface aru/faces/less-important nil
  "Face for information which is not as important as `aru/faces/important'."
  :group 'aru/faces)

(defface aru/faces/not-important nil
  "Face for not so important information."
  :group 'aru/faces)

(defface aru/faces/not-important-color nil
  "Face for important information between not so important information."
  :group 'aru/faces)

(defface aru/faces/warning nil
  "Face for strings or warnings."
  :group 'aru/faces)

(defface aru/faces/danger nil
  "Face for errors."
  :group 'aru/faces)

(defface aru/faces/success nil
  "Face for things that went well."
  :group 'aru/faces)

(defface aru/faces/selected nil
  "Face for selection."
  :group 'aru/faces)

(defface aru/faces/selected-important nil
  "Face for important selections."
  :group 'aru/faces)

(defface aru/faces/diff-added nil
  "Face for added stuff in diffs."
  :group 'aru/faces)

(defface aru/faces/diff-removed nil
  "Face for removed stuff in diffs."
  :group 'aru/faces)

(defface aru/faces/diff-changed nil
  "Face for changed stuff in diffs."
  :group 'aru/faces)

(defvar *group* "")
(defun get-symbol (name &optional group)
  (intern-soft (concat (or group *group*) name)))

(defmacro aru/theme (theme-name)
  "Set color theme to VARIANT."
  (let ((*group* (concat "aru/colors/" theme-name "/")))
    `(defun ,(intern (concat "aru/theme/" theme-name)) ()
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
                           :foreground ,(get-symbol "gold")))))

(aru/theme "rose-pine")
(aru/theme "rose-pine-moon")
(aru/theme "rose-pine-dawn")

(aru/theme/rose-pine-dawn)

(cl-defun set-face (face style &key height)
  "Reset a face and make it inherit style."
  (set-face-attribute face nil
   :foreground 'unspecified :background 'unspecified
   :family     'unspecified :slant      'unspecified
   :weight     'unspecified :height     (or height 'unspecified)
   :underline  'unspecified :overline   'unspecified
   :box        'unspecified :inherit    style))

(set-face 'cursor                              'default)
(set-face 'fixed-pitch                         'default)
(set-face 'fixed-pitch-serif                   'default)
(set-face 'variable-pitch                      'default)

(set-face 'show-paren-match                    'aru/faces/very-important)

(set-face 'bold                                'aru/faces/important)
(set-face 'buffer-menu-buffer                  'aru/faces/important)
(set-face 'font-lock-function-name-face        'aru/faces/important)
(set-face 'font-lock-variable-name-face        'aru/faces/important)
(set-face 'info-node                           'aru/faces/important)
(set-face 'info-title-1                        'aru/faces/important :height 1.40)
(set-face 'info-title-2                        'aru/faces/important :height 1.30)
(set-face 'info-title-3                        'aru/faces/important :height 1.20)
(set-face 'info-title-4                        'aru/faces/important :height 1.10)
(set-face 'isearch                             'aru/faces/important)
(set-face 'minibuffer-prompt                   'aru/faces/important)

;;; Org
(with-eval-after-load "org"
  (set-face 'org-document-title                'aru/faces/important :height 1.50)
  (set-face 'org-level-1                       'aru/faces/important :height 1.40)
  (set-face 'org-level-2                       'aru/faces/important :height 1.35)
  (set-face 'org-level-3                       'aru/faces/important :height 1.30)
  (set-face 'org-level-4                       'aru/faces/important :height 1.25)
  (set-face 'org-level-5                       'aru/faces/important :height 1.20)
  (set-face 'org-level-6                       'aru/faces/important :height 1.15)
  (set-face 'org-level-7                       'aru/faces/important :height 1.10)
  (set-face 'org-level-8                       'aru/faces/important :height 1.05))

(set-face 'font-lock-builtin-face              'aru/faces/less-important)
(set-face 'font-lock-keyword-face              'aru/faces/less-important)
(set-face 'font-lock-type-face                 'aru/faces/less-important)
(set-face 'link                                'aru/faces/less-important)

(set-face 'font-lock-comment-face              'aru/faces/not-important)
(set-face 'font-lock-doc-face                  'aru/faces/not-important)
(set-face 'fringe                              'aru/faces/not-important)
(set-face 'Info-quoted                         'aru/faces/not-important)
(set-face 'shadow                              'aru/faces/not-important)

(set-face 'font-lock-constant-face             'aru/faces/not-important-color)
(set-face 'font-lock-doc-markup-face           'aru/faces/not-important-color)

(set-face 'font-lock-string-face               'aru/faces/warning)
(set-face 'font-lock-warning-face              'aru/faces/warning)
(set-face 'warning                             'aru/faces/warning)

(set-face 'error                               'aru/faces/danger)
(set-face 'font-lock-negation-char-face        'aru/faces/danger)
(set-face 'isearch-fail                        'aru/faces/danger)

(set-face 'success                             'aru/faces/success)

(set-face 'highlight                           'aru/faces/selected)
(set-face 'lazy-highlight                      'aru/faces/selected)
(set-face 'region                              'aru/faces/selected)
(set-face 'secondary-selection                 'aru/faces/selected)

(set-face 'match                               'aru/faces/selected-important)
(set-face 'trailing-whitespace                 'aru/faces/selected-important)

;;; Magit
(with-eval-after-load "magit"
  (set-face 'magit-keyword                     'aru/faces/less-important)
  (set-face 'git-commit-keyword                'aru/faces/less-important)
  (set-face 'git-commit-comment-heading        'default)
  (set-face 'magit-diff-revision-summary       nil)
  (set-face 'git-commit-summary                'default)
  (set-face 'git-commit-comment-file           'aru/faces/important)
  (set-face 'git-commit-comment-action         'aru/faces/important)
  (set-face 'magit-diff-added                  'aru/faces/diff-added)
  (set-face 'magit-diffstat-added              'aru/faces/diff-added)
  (set-face 'diff-refine-added                 'aru/faces/diff-added)
  (set-face 'magit-diff-added-highlight        'aru/faces/diff-added)
  (set-face 'magit-diff-hunk-heading           'aru/faces/not-important-color)
  (set-face 'magit-diff-hunk-heading-highlight nil)
  (set-face 'magit-diff-hunk-heading-selection nil)
  (set-face 'magit-diff-context                'aru/faces/not-important)
  (set-face 'magit-diff-context-highlight      'aru/faces/not-important)
  (set-face 'magit-diff-file-heading           'aru/faces/important)
  (set-face 'magit-diff-removed                'aru/faces/diff-removed)
  (set-face 'magit-diffstat-removed            'aru/faces/diff-removed)
  (set-face 'diff-refine-removed               'aru/faces/diff-removed)
  (set-face 'magit-diff-removed-highlight      'aru/faces/diff-removed)
  (set-face 'magit-diff-lines-heading          'aru/faces/selected)
  (set-face 'magit-section-highlight           nil)
  (set-face 'magit-section-heading             'aru/faces/warning)
  (set-face 'magit-section-secondary-heading   'aru/faces/warning)
  (set-face 'magit-branch-local                'aru/faces/important)
  (set-face 'magit-branch-remote               'aru/faces/important)
  (set-face 'magit-branch-remote-head          'aru/faces/important)
  (set-face 'magit-branch-upstream             'aru/faces/important)
  (set-face 'magit-hash                        'aru/faces/not-important)
  (set-face 'magit-section-heading-selection   nil))

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
