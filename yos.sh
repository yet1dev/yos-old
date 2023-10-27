#==========================================
#               YELLOW OS
#==========================================
arg=$1
YOS='/sdcard/0-yos'
HOST='/data/data/com.termux/files'

mkdir -p ${YOS}

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
	save) SaveCommand;;
	*)  echo 'Command not implemented yet'
esac
