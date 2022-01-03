# vim: set ft=zsh: 
# utility
alias v='nvim'
alias gw='./gradlew'
alias gwi='./gradlew -i'
alias mkdir='mkdir -pv'
alias e='exit'

alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias l='ls -lh --color --group-directories-first'
alias ll='ls -Alh --color --group-directories-first'

alias ff="find . -type f -name"

# post aliases
alias -g L='| less -R'
alias -g G='| grep'

# vagrant
alias vup='vagrant up'
alias vdn='vagrant halt'

# git
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gcan='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcm='git checkout master'
alias gcd='git checkout dev'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gd='git diff'
alias gds='git diff --staged'
alias gf='git fetch'
alias gl='git pull --ff-only'
alias glr='git pull --rebase'
alias glg='git log --pretty=format:"%C(yellow)%h %ad%Cred%d %Creset%s%Cblue [%cn]" --decorate --date=relative'
alias gll='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gls='git log --pretty=format:"%C(yellow)%h%Cred%d %Creset%s%Cblue [%cn]" --decorate --numstat'
alias gp='git push'
alias gst='git status --short --branch'
alias grc="git rev-parse HEAD | tr -d '\n' | xsel"

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods -o=wide'
alias kdp='kubectl describe pods'
alias krp='kubectl delete pods'

alias kgs='kubectl get svc'
alias kga='kubectl get all'

alias kl="kubectl logs"
alias kbb="kubectl run -i --tty debug --image=nicolaka/netshoot --restart=Never -- sh"
alias bbbd="kubectl delete pod debug"
alias kaa="kubectl run -i --tty aws --image=mesosphere/aws-cli --restart=Never --command -- sh"
alias kaad="kubectl delete pod aws"

# Helm
alias h="helm"
alias hi="helm install"
alias hd="helm delete"
alias hdp="helm delete --purge"

# Minikube
alias m="minikube"
alias md="minikube dashboard"
alias mst="minikube start --vm-driver=kvm2 --memory=8096 --cpus=6 --kubernetes-version=v1.10.0 -v3"
alias ms="minikube status"

# Skaffold
alias s="skaffold"
alias sdep="skaffold deploy"
alias sdel="skaffold delete"

# Docker
alias d='docker'
alias di='docker images'

# configs
alias cn='$EDITOR ~/.config/nvim/init.lua'
alias cz='$EDITOR ~/.zshrc'
alias ct='$EDITOR ~/.tmux.conf'
alias ca='$EDITOR ~/.zsh/aliases'
alias cx='$EDITOR ~/.xmonad/xmonad.hs'
alias cxk='$EDITOR ~/.xmonad/src/XMonad/MyKeys.hs'
alias sz='source ~/.zshrc'

# taskwarrior
alias tw='task'
alias twa='task add'
alias twd='task done'
alias twr='task ready'
alias twl='task log'

# newsboat
alias nb='newsboat'

# pacman
alias p='pacman'
alias sp='sudo pacman'

# yaourt
alias ys='y -S'
alias yss='y -Ss'

# systemd
alias sc='systemctl'

# pulse audio
alias pc='pactl'

# password store
alias pw='pass'

# xdg-open
alias xo='xdg-open'

##################### 
#      TMUX         #
##################### 

# General short cut
alias t=' tmux'

# Creates a new session
alias tn=' tmux new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'

# Lists all ongoing sessions
alias tl='tmux list-sessions'alias ta='tmux attach'

############################################################################
#                                                                          #
#               ------- Useful Docker Aliases --------                     #
#                                                                          #
#     # Usage:                                                             #
#     daws <svc> <cmd> <opts> : aws cli in docker with <svc> <cmd> <opts>  #
#     dc             : docker-compose                                      #
#     dcu            : docker-compose up -d                                #
#     dcd            : docker-compose down                                 #
#     dcr            : docker-compose run                                  #
#     dex <container>: execute a bash shell inside the RUNNING <container> #
#     di <container> : docker inspect <container>                          #
#     dim            : docker images                                       #
#     dip            : IP addresses of all running containers              #
#     dl <container> : docker logs -f <container>                          #
#     dnames         : names of all running containers                     #
#     dps            : docker ps                                           #
#     dpsa           : docker ps -a                                        #
#     drmc           : remove all exited containers                        #
#     drmid          : remove all dangling images                          #
#     drun <image>   : execute a bash shell in NEW container from <image>  #
#     dsr <container>: stop then remove <container>                        #
#                                                                          #
############################################################################

function dnames-fn {
	for ID in `docker ps | awk '{print $1}' | grep -v 'CONTAINER'`
	do
    	docker inspect $ID | grep Name | head -1 | awk '{print $2}' | sed 's/,//g' | sed 's%/%%g' | sed 's/"//g'
	done
}

function dip-fn {
    echo "IP addresses of all named running containers"

    for DOC in `dnames-fn`
    do
        IP=`docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' "$DOC"`
        OUT+=$DOC'\t'$IP'\n'
    done
    echo -e $OUT | column -t
    unset OUT
}

function dex-fn {
	docker exec -it $1 ${2:-bash}
}

function di-fn {
	docker inspect $1
}

function dl-fn {
	docker logs -f $1
}

function drun-fn {
	docker run -it $1 $2
}

function dcr-fn {
	docker-compose run $@
}

function dsr-fn {
	docker stop $1;docker rm $1
}

function drmc-fn {
       docker rm $(docker ps --all -q -f status=exited)
}

function drmid-fn {
       imgs=$(docker images -q -f dangling=true)
       [ ! -z "$imgs" ] && docker rmi "$imgs" || echo "no dangling images."
}

# in order to do things like dex $(dlab label) sh
function dlab {
       docker ps --filter="label=$1" --format="{{.ID}}"
}

function dc-fn {
        docker-compose $*
}

function d-aws-cli-fn {
    docker run \
           -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
           -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
           -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
           amazon/aws-cli:latest $1 $2 $3
}

alias daws=d-aws-cli-fn
alias dc=dc-fn
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcr=dcr-fn
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps"
alias dpsa="docker ps -a"
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
alias dsp="docker system prune --all"
alias dsr=dsr-fn

alias hm=home-manager
