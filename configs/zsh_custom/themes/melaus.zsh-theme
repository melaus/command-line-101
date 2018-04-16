local ret_status="%(?:%{$fg_bold[green]%}(^.^:%{$fg_bold[red]%}(o.O))"
local user_details="%{$fg[blue]%}%n@%m"

# [00:00:00] melaus@location (^.^) git:(branch) full_path
PROMPT='%{$fg[blue]%}%D{[%X]} ${user_details} ${ret_status} $(git_prompt_info) %{$reset_color%}%~
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
