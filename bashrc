alias ack=ack-grep
export EDITOR=vim

# -------------------------------------------------------
# GIT ALIAS
# -------------------------------------------------------
alias st="git status"
alias gitst="git status"
alias gitpush="git push origin HEAD"
alias undo_last_commit="git reset --soft HEAD~"
alias diff_staged_things="git diff --cached"
alias unmerged_branches="git branch --no-merged"
alias git_log="git log --graph --oneline --color"
alias git_network="git log --graph --oneline --color"

# -------------------------------------------
# CUSTOM .BASHRC TO SHOW GIT BRANCH
# -------------------------------------------

#Add git branch if its present to PS1
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt

