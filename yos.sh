#==========================================
#               YELLOW OS
#==========================================
arg="$1"
val1="$2"
val2="$3"

YOS='/sdcard/0-yos'
HOST='/data/data/com.termux/files'
APPS='git openssl openssh micro zellij htop musl-dev sudo rustup'
#==========================================
SetupCommand(){
	apk update
	apk add ${APPS}

# SYSTEM LOGIN
	# read -p 'User: ' USER
	# read -p 'Password: ' PASSWORD

# GIT CONFIGURATION
	read -p 'Name: ' NAME
	read -p 'Email: ' EMAIL

	git config --global user.name  "${NAME}"
	git config --global user.email "${EMAIL}"
}

ShowRun(){
	printf "\e[33;1mRunning: \e[0m${val1}\n"
	sleep 1; eval "${val1}"
}

SaveCommand(){
	cd ${HOST}
	mkdir -p ${YOS}

	rm ${YOS}/yos.tar
	tar -cvpf ${YOS}/yos.tar home
}

PromptCommand(){
	[ "${PWD}" != "${PWD#$HOME}" ] && apath="~${PWD#$HOME}" || apath=${PWD}

	[ "${USER}" = "root" ] \
		&& { signal=${val1:-#}; user=$(printf "\e[1;31mROOT\e[0m"); } \
		|| { signal=${val1:-$}; user=$(printf "\e[1;32m${USER}\e[0m"); }  # Bold red / Bold green [rootless]

	head=$(    printf "\e[0;36m${head}\e[0m"             ) # Normal Cyan
	apath=$(   printf "\e[0;36m${apath}\e[0m"            ) # Normal Cyan

	printf "╭─${user} in ${apath} \n╰─${signal} "
}

#==========================================
#            READ THE INPUT
#==========================================
case $arg in
	run)  proot-distro login alpine --termux-home -- bash;;
	save) SaveCommand;;
	setup) SetupCommand;;
	prompt) PromptCommand;;
	show-run) ShowRun;;
	*)  echo 'Command not implemented yet'
esac
