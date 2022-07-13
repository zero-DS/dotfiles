
PROMPT='%F{000}%K{250}%~%f%k %F{208}>%f%F{119}>%f%F{039}>%f '

# zsh로 쉘 실행시 bash_profile이 실행되도록 해줌
if [ -f ~/.bash_profile ]; then
  . ~/.bash_profile
fi

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# 탭 누르면 기록기반 자동완성
bindkey '^I' autosuggest-accept
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(buffer-empty bracketed-paste accept-line push-line-or-edit)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true
# 쉬프트+ 탭 누르면 디렉터리 내 자동완성
bindkey '^[[Z' complete-word

