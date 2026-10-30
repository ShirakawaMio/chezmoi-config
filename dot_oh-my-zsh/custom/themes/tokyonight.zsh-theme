# TokyoNight-inspired Oh My Zsh theme.
# Starship is initialized after Oh My Zsh and provides the final prompt.
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %{$fg[magenta]%}%{$git_branch_prompt%}%{$reset_color%}%# '
RPROMPT='%{$fg[cyan]%}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX='%{$fg[blue]%} '
ZSH_THEME_GIT_PROMPT_SUFFIX='%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_DIRTY='%{$fg[red]%} ✗'
ZSH_THEME_GIT_PROMPT_CLEAN='%{$fg[green]%} ✓'
