(deftheme aru/themes/gruvbox-dark
  "Gruvbox dark theme.")

(require 'aru/themes)
(require 'aru/colors)

(aru/colors/generate-colors
 "gruvbox-dark"
 (("base"           . "#1d2021")
  ("surface"        . "#282828")
  ("overlay"        . "#3c3836")
  ("muted"          . "#bdae93")
  ("subtle"         . "#d5c4a1")
  ("text"           . "#ebdbb2")
  ("love"           . "#cc241d")
  ("gold"           . "#d79921")
  ("rose"           . "#689d6a")
  ("pine"           . "#98971a")
  ("foam"           . "#458588")
  ("iris"           . "#b16286")
  ("highlight-low"  . "#504945")
  ("highlight-med"  . "#665c54")
  ("highlight-high" . "#7c6f64")))

(aru/themes/generate-theme "gruvbox-dark")

(provide-theme 'aru/themes/gruvbox-dark)
