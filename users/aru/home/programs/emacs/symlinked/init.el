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

