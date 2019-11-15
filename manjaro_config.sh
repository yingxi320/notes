#!/usr/bin/bash

############
function install_pkg(){
	# pkg_name=$1
	sudo pacman -Q $1

	if [[ $? == 0 ]]
	then
		echo "package $1 has installed"
	else
		sudo pacman -Sy $1
	fi
}	
#############

# 设置系统源为中国区域，并更新系统
sudo pacman-mirrors -i -c China -m rank && sudo pacman -Syyu

grep -wq "archlinuxcn"  /etc/pacman.conf
if [[ $? == 0 ]]
then 
	
else 
	# 设置下载仓库源
	cat >> /etc/pacman.conf << EOF
	[archlinuxcn]
	SigLevel = Optional TrustedOnly
	Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
EOF
fi


install_pkg archlinuxcn-keyring

## 安装搜狗输入法
for pkg in fcitx-im fcitx-configtool fcitx-sogoupinyin
do 
	install_pkg pkg
done

if [ -e ~/.xprofile ]
then 
	
else 
	cat >> ~/.xprofile << EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
EOF
fi


## 要是出现错误为：搜狗输入法异常！请删除.config/SogouPY 并重启，则执行sudo pacman -S fcitx-qt4

for pkg in typora  google-chrome  visual-studio-code-bin  deepin-screenshot	shadowsock-qt5  uget
do
	install_pkg pkg
done

### Q&A
# 1) manjaro更新后，中文显示为方框：sudo pacman -S wqy-microhei
#2)  
