# ==========================================================
# MSYS2 zshrc (Windows GUI + Unix-like shell)
# - Keep MSYS2 ~ as-is (this file is ~/.zshrc)
# - Auto-share Windows folders/config via symlinks:
#   ~/Documents, ~/.ssh, ~/.aws, ~/.kube
# - Prefer Windows CLIs for credential sharing: az.exe / aws.exe / ssh.exe
# - Keep your oh-my-zsh config (robbyrussell + git)
# ==========================================================
export PATH="/c/Program Files/nodejs:$PATH"
export PATH="/c/Program Files/nodejs:$PATH"

alias node='node.exe'
alias npm='npm.cmd'

# ---------- 0) Basic paths ----------
export WINHOME="/c/Users/${USERNAME}"
export wh="$WINHOME"  # <-- 타협안: cd $wh 로 Windows 유저 홈 이동

# Documents could be redirected to OneDrive on some machines
if [[ -d "$WINHOME/OneDrive/Documents" ]]; then
  export WDOCS="$WINHOME/OneDrive/Documents"
else
  export WDOCS="$WINHOME/Documents"
fi

# Optional convenience vars (you can use: cd $wdocs)
export wdocs="$WDOCS"

# ---------- 1) Auto-create symlinks to Windows profile (no more warnings) ----------
# Only create if missing, and only if Windows source exists.
[[ -e "$HOME/Documents" ]] || ln -s "$WDOCS" "$HOME/Documents" 2>/dev/null

[[ -e "$HOME/.ssh" ]] || { [[ -d "$WINHOME/.ssh" ]] && ln -s "$WINHOME/.ssh" "$HOME/.ssh" 2>/dev/null; }
[[ -e "$HOME/.aws" ]] || { [[ -d "$WINHOME/.aws" ]] && ln -s "$WINHOME/.aws" "$HOME/.aws" 2>/dev/null; }
[[ -e "$HOME/.kube" ]] || { [[ -d "$WINHOME/.kube" ]] && ln -s "$WINHOME/.kube" "$HOME/.kube" 2>/dev/null; }

# (Optional) Azure CLI state dir (only useful if you also keep .azure in Windows profile)
[[ -e "$HOME/.azure" ]] || { [[ -d "$WINHOME/.azure" ]] && ln -s "$WINHOME/.azure" "$HOME/.azure" 2>/dev/null; }

# ---------- 2) Editors / vi ----------
# Install: pacman -S vim
export EDITOR="vim"
export VISUAL="vim"
alias vi="vim"

# ---------- 3) CLI tools: prefer Windows EXEs for shared creds ----------
alias az='az.exe'
alias aws='aws.exe'
alias kubectl='kubectl.exe'
alias helm='helm.exe'

# ---------- 4) SSH: safest approach on Windows is Windows OpenSSH ----------
alias ssh='ssh.exe'
alias scp='scp.exe'
alias sftp='sftp.exe'

# Make Git use Windows ssh as well
export GIT_SSH='ssh.exe'
# If needed instead:
# export GIT_SSH_COMMAND='ssh.exe'

# ---------- 5) Start in Documents when launching an interactive shell ----------
if [[ -o interactive ]]; then
  if [[ "$PWD" == "$HOME" ]]; then
    cd "$HOME/Documents" 2>/dev/null || true
  fi
fi

# ---------- 6) History (bigger + nicer) ----------
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt SHARE_HISTORY

# ---------- 7) oh-my-zsh ----------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

