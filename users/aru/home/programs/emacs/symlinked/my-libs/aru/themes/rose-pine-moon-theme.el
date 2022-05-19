(deftheme aru/themes/rose-pine-moon
  "Rose pine moon theme.")

(require 'aru/themes/rose-pine-common)

(aru/themes/rose-pine-generate-colors
 "rose-pine-moon"
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

(aru/themes/rose-pine-set-theme "rose-pine-moon")

(provide-theme 'aru/themes/rose-pine-moon)
