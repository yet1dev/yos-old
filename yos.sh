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
	save) SaveCommand;;
	*)  echo 'Command not implemented yet'
esac
