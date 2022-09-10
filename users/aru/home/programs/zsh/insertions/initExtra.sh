bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[3~"   delete-char

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01D2021" #black
    echo -en "\e]P8282828" #darkgrey
    echo -en "\e]P1CC241D" #darkred
    echo -en "\e]P9FB4934" #red
    echo -en "\e]P298971A" #darkgreen
    echo -en "\e]PAB8BB26" #green
    echo -en "\e]P3D65D0E" #brown
    echo -en "\e]PBD79921" #yellow
    echo -en "\e]P4458588" #darkblue
    echo -en "\e]PC83A598" #blue
    echo -en "\e]P5B16286" #darkmagenta
    echo -en "\e]PDD3869B" #magenta
    echo -en "\e]P6689D6A" #darkcyan
    echo -en "\e]PE8EC07C" #cyan
    echo -en "\e]P7A89984" #lightgrey
    echo -en "\e]PFEBDBB2" #white
    clear #for background artifacting
fi

eval "$(direnv hook zsh)"
