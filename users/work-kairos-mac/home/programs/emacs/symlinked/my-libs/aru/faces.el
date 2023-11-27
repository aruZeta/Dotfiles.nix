;;;; Face group

(defgroup aru/faces nil
  "Group for faces."
  :prefix "aru/faces/"
  :group 'faces)

;;;; My faces

(defface aru/faces/very-important nil
  "Face for very important information."
  :group 'aru/faces)

(defface aru/faces/important nil
  "Face for important information."
  :group 'aru/faces)

(defface aru/faces/important-color nil
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

(defface aru/faces/modeline nil
  "Face for modeline."
  :group 'aru/faces)

(defface aru/faces/modeline-inactive nil
  "Face for modeline in inactive buffers."
  :group 'aru/faces)

(defface aru/faces/wont-see nil
  "Face for things you don't want to see."
  :group 'aru/faces)

(defface aru/faces/term-base nil
  "Face for terminal black."
  :group 'aru/faces)

(defface aru/faces/term-love nil
  "Face for terminal red."
  :group 'aru/faces)

(defface aru/faces/term-pine nil
  "Face for terminal green."
  :group 'aru/faces)

(defface aru/faces/term-gold nil
  "Face for terminal yellow."
  :group 'aru/faces)

(defface aru/faces/term-foam nil
  "Face for terminal blue."
  :group 'aru/faces)

(defface aru/faces/term-iris nil
  "Face for terminal magenta."
  :group 'aru/faces)

(defface aru/faces/term-rose nil
  "Face for terminal cyan."
  :group 'aru/faces)

(defface aru/faces/term-text nil
  "Face for terminal white."
  :group 'aru/faces)

;;;; Helpful functions

(cl-defun set-face (face style &key height)
  "Reset a face and make it inherit style."
  (set-face-attribute face nil
   :foreground 'unspecified :background 'unspecified
   :family     'unspecified :slant      'unspecified
   :weight     'unspecified :height     (or height 'unspecified)
   :underline  'unspecified :overline   'unspecified
   :box        'unspecified :inherit    style))

;;;; Faces

;;; Structural
(set-face 'bold                                'aru/faces/important)
(set-face 'cursor                              'default)
(set-face 'fixed-pitch                         'default)
(set-face 'fixed-pitch-serif                   'default)
(set-face 'highlight                           'aru/faces/selected)
(set-face 'region                              'aru/faces/selected)
(set-face 'variable-pitch                      'default)

;;; Semantic
(set-face 'error                               'aru/faces/danger)
(set-face 'match                               'aru/faces/selected-important)
(set-face 'shadow                              'aru/faces/not-important)
(set-face 'success                             'aru/faces/success)
(set-face 'warning                             'aru/faces/warning)

;;; General
(set-face 'buffer-menu-buffer                  'aru/faces/important)
(set-face 'fringe                              'aru/faces/not-important)
(set-face 'isearch                             'aru/faces/important)
(set-face 'isearch-fail                        'aru/faces/danger)
(set-face 'lazy-highlight                      'aru/faces/selected)
(set-face 'link                                'aru/faces/less-important)
(set-face 'minibuffer-prompt                   'aru/faces/important)
(set-face 'secondary-selection                 'aru/faces/selected)
(set-face 'show-paren-match                    'aru/faces/very-important)
(set-face 'trailing-whitespace                 'aru/faces/selected-important)

;;; Programmation mode
(set-face 'font-lock-builtin-face              'aru/faces/less-important)
(set-face 'font-lock-comment-face              'aru/faces/not-important)
(set-face 'font-lock-constant-face             'aru/faces/not-important-color)
(set-face 'font-lock-doc-face                  'aru/faces/not-important)
(set-face 'font-lock-doc-markup-face           'aru/faces/not-important-color)
(set-face 'font-lock-function-name-face        'aru/faces/important)
(set-face 'font-lock-keyword-face              'aru/faces/less-important)
(set-face 'font-lock-negation-char-face        'aru/faces/danger)
(set-face 'font-lock-string-face               'aru/faces/warning)
(set-face 'font-lock-type-face                 'aru/faces/less-important)
(set-face 'font-lock-variable-name-face        'aru/faces/important)
(set-face 'font-lock-warning-face              'aru/faces/warning)

;;; Documentation
(set-face 'info-node                           'aru/faces/important)
(set-face 'Info-quoted                         'aru/faces/not-important)
(set-face 'info-title-1                        'aru/faces/important :height 1.40)
(set-face 'info-title-2                        'aru/faces/important :height 1.30)
(set-face 'info-title-3                        'aru/faces/important :height 1.20)
(set-face 'info-title-4                        'aru/faces/important :height 1.10)

;;; Modeline
(set-face 'mode-line                           'aru/faces/modeline)
;(set-face 'mode-line-active                    'aru/faces/modeline)
(set-face 'mode-line-inactive                  'aru/faces/modeline-inactive)

;;; Doom modeline
(set-face 'doom-modeline-bar                   'aru/faces/modeline-inactive)
(set-face 'doom-modeline-bar-inactive          'aru/faces/modeline-inactive)

;;; Window
(set-face 'vertical-border                     'aru/faces/wont-see)

;;; Org
(with-eval-after-load "org"
  (set-face 'org-document-title
            'aru/faces/important-color
            :height 1.50)
  (set-face 'org-level-1
            'aru/faces/important-color
            :height 1.30)
  (set-face 'org-level-2
            'aru/faces/important-color
            :height 1.25)
  (set-face 'org-level-3
            'aru/faces/important-color
            :height 1.20)
  (set-face 'org-level-4
            'aru/faces/important-color
            :height 1.15)
  (set-face 'org-level-5
            'aru/faces/important-color
            :height 1.10)
  (set-face 'org-level-6
            'aru/faces/important-color
            :height 1.08)
  (set-face 'org-level-7
            'aru/faces/important-color
            :height 1.05)
  (set-face 'org-level-8
            'aru/faces/important-color
            :height 1.02)
  (set-face 'org-document-info 'aru/faces/less-important)
  (set-face-attribute 'org-ellipsis nil
                      :foreground 'unspecified
                      :underline  'unspecified)
  (set-face 'org-block 'default)
  (set-face-attribute 'org-block nil
                      :background (face-attribute 'aru/faces/modeline-inactive
                                                  :background)))

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

;;; Nxml
(with-eval-after-load "nxml"
  (set-face 'nxml-attribute-local-name 'aru/faces/less-important)
  (set-face 'nxml-element-prefix 'aru/faces/not-important-color)
  (set-face 'nxml-element-colon 'aru/faces/not-important-color))

(with-eval-after-load "vterm"
  (set-face 'vterm-color-black   'aru/faces/term-base)
  (set-face 'vterm-color-red     'aru/faces/term-love)
  (set-face 'vterm-color-green   'aru/faces/term-pine)
  (set-face 'vterm-color-yellow  'aru/faces/term-gold)
  (set-face 'vterm-color-blue    'aru/faces/term-foam)
  (set-face 'vterm-color-magenta 'aru/faces/term-iris)
  (set-face 'vterm-color-cyan    'aru/faces/term-rose)
  (set-face 'vterm-color-white   'aru/faces/term-text))

(provide 'aru/faces)
