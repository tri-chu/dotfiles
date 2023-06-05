bind -f ~/.inputrc
export ANDROID_HOME=/opt/homebrew/share/android-sdk
export ANDROID_SDK_ROOT=/opt/homebrew/share/android-sdk
export PATH=$PATH:/opt/homebrew/share/android-sdk/platform-tools
source /opt/homebrew/etc/bash_completion.d/bazel-complete.bash
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home

# added for npm-completion https://github.com/Jephuff/npm-bash-completion
PATH_TO_NPM_COMPLETION="/Users/trichu/.nvm/versions/node/v12.22.11/lib/node_modules/npm-completion"
source $PATH_TO_NPM_COMPLETION/npm-completion.sh


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
