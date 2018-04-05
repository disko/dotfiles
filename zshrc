export PATH=/usr/local/bin:$PATH

# Load Antigen

source /usr/local/share/antigen/antigen.zsh

antigen use oh-my-zsh


# antigen bundle zdharma/fast-syntax-highlighting


#
# Antigen Bundles
#

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-autosuggestions

antigen bundle git
# For SSH, starting ssh-agent is annoying
#antigen bundle ssh-agent

# Node Plugins
#antigen bundle coffee
#antigen bundle node
#antigen bundle npm

# Python Plugins
antigen bundle pip
antigen bundle evrardjp/pip-app
antigen bundle python
antigen bundle virtualenv

# these are needed for "pyenv install"
export CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib"
eval "$(pyenv init -)"


#antigen bundle brew
#antigen bundle brew-cask
antigen bundle osx
# antigen bundle gem

#################
# CLEAN PROJECT # 
#################
#export AUTO_CLEAN_PROJECT=true
#export AUTO_CLEAN_PROJECT_FILE_PATTERNS=(
#  ".DS_Store"
#  "Thumbs.db"
#  "*.pyc"
#)
#export AUTO_CLEAN_PROJECT_IGNORE_PATHS=(
#  "./node_modules/*"
#  "./bower_components/*"
#)
# antigen bundle wwilsman/zsh-clean-project

#########
# THEME #
#########

# antigen theme zakaziko99/agnosterzak-ohmyzsh-theme agnosterzak
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir status)	
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs vcs pyenv)
antigen theme bhilburn/powerlevel9k powerlevel9k

# must be at the end: https://github.com/zsh-users/zsh-syntax-highlighting#why-must-zsh-syntax-highlightingzsh-be-sourced-at-the-end-of-the-zshrc-file
antigen bundle zsh-users/zsh-syntax-highlighting

antigen apply


alias flac2mp3="parallel ffmpeg -i {} -qscale:a 0 {.}.mp3 :::"