(deftheme aru/theme/rose-pine
  "Rose pine themes.")

(require 'aru/themes/rose-pine-common)

(aru/themes/rose-pine-generate-colors
 "rose-pine"
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

(aru/themes/rose-pine-set-theme "rose-pine")

(provide-theme 'aru/themes/rose-pine)
