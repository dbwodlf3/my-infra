setopt PROMPT_SUBST
autoload -U colors && colors

PROMPT='%F{244}┌─[%f%F{cyan}%~%f%F{244}]%f $(git_prompt_info)'
PROMPT+=$'\n'
PROMPT+='%F{244}└──%f %(?.%F{green}.%F{red})➤ %f%(!.#.$) '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
