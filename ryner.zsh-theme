GREEN="%{$fg_bold[green]%}"
YELLOW="%{$fg_bold[yellow]%}"
CYAN="%{$fg_bold[cyan]%}"
RED="%{$fg_bold[red]%}"
RESET="%{$reset_color%}"

function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='$RED=>$GREEN main$YELLOW λ$GREEN ($YELLOW$(get_pwd)$GREEN)$YELLOW$(git_prompt_info) $RED= $RESET'

ZSH_THEME_GIT_PROMPT_PREFIX="$GREEN ($YELLOW$GREEN, $CYAN"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="$GREEN, $RED⦿)"
ZSH_THEME_GIT_PROMPT_CLEAN="$GREEN, $GREEN⦾)"
