
PROMPT='%F{000}%K{250}%~%f%k %F{208}>%f%F{119}>%f%F{039}>%f '

[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

export PKG_CONFIG_PATH=/opt/homebrew/Cellar/opencv/4.5.4_4/lib/pkgconfig

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sdsmba/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sdsmba/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/sdsmba/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sdsmba/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# conda 자동 활성화 false (conda activate 로 활성화 가능)
__auto_activate_base=False
# <<< conda initialize <<<

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 탭 누르면 기록기반 자동완성
bindkey '^I' autosuggest-accept
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
# 쉬프트+ 탭 누르면 디렉터리 내 자동완성
bindkey '^[[Z' complete-word

