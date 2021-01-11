# Bash_profile
source /Users/catman/.mbprc

# Path to your oh-my-zsh installation.
export ZSH="/Users/catman/.oh-my-zsh"

# Theme
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  battery       # Battery level and status
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  php           # PHP section
  rust          # Rust section
  haskell       # Haskell Stack section
  julia         # Julia section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  dotnet        # .NET section
  ember         # Ember.js section
  kubecontext   # Kubectl context section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  user          # Username section
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

#ZSH_THEME="jnrowe"
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
# time
SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX=" 💭   ⌚️【"
SPACESHIP_TIME_SUFFIX="】"
#user
SPACESHIP_USER_SHOW="always"
SPACESHIP_USER_PREFIX="👨‍💻‍:"

SPACESHIP_DIR_PREFIX="📁:"
# battery
SPACESHIP_BATTERY_SHOW="always"
SPACESHIP_BATTERY_PREFIX="🔋"
SPACESHIP_BATTERY_SYMBOL_CHARGING="🔌"
SPACESHIP_BATTERY_SYMBOL_DISCHARGING="⚡️"
SPACESHIP_BATTERY_THRESHOLD=10

SPACESHIP_PROMPT_DEFAULT_PREFIX=" 📍  "



#ZSH_THEME="spaceship"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="ys_"
#ZSH_THEME="agnoster"


#Plugins
plugins=(git
	autojump
        zsh-syntax-highlighting
)


source $ZSH/oh-my-zsh.sh


# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#EXT
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi
# thefuck
eval $(thefuck --alias)
