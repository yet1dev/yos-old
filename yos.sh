#==========================================
#               YELLOW OS
#==========================================
arg=$1
YOS='/sdcard/0-yos'
HOST='/data/data/com.termux/files'
APPS='git openssl openssh micro zellij htop musl-dev sudo rustup'
#==========================================
mkdir -p ${YOS}

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

	rm ${YOS}/yos.tar
	tar -cvpf ${YOS}/yos.tar home
}

#==========================================
#            READ THE INPUT
#==========================================
case $arg in
	run)  proot-distro login alpine --termux-home -- bash;;
	setup) SetupCommand;;
	save) SaveCommand;;
	*)  echo 'Command not implemented yet'
esac
