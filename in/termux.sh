#============================
#      TERMUX SCRIPT
#============================
YOS='/sdcard/0-yos'
HOST='/data/data/com.termux/files'
termux-setup-storage

rm -rf storage
apt update
apt install -y proot-distro

[ -f ${YOS}/yos.tar ] && { cd ~/.. ; rm -rf home; tar -xvpf ${YOS}/yos.tar; }

curl -LO yet1dev.com/yos/yos.sh
chmod 777 yos.sh
mv ./yos.sh ${HOST}/usr/bin/yos

proot-distro install alpine
proot-distro login alpine -- yos setup

termux-reload-settings
