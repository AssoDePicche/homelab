ZSH_THEME="spaceship"

CASE_SENSITIVE="true"

zstyle ':omz:update' mode auto

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

alias zshconfig="mate ~/.zshrc"

alias ohmyzsh="mate ~/.oh-my-zsh"

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  host
  git
  hg
  exec_time
  line_sep
  jobs
  exit_code
  char
)

SPACESHIP_USER_SHOW=always

SPACESHIP_PROMPT_ADD_NEW_LINE=false

SPACESHIPT_CHAR_SUFFIX=" "
