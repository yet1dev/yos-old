#==========================================
#               YELLOW OS
#==========================================
arg=$1
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
	setup) SetupCommand;;
	prompt) PromptCommand;;
	save) SaveCommand;;
	*)  echo 'Command not implemented yet'
esac
