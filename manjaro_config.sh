#!/usr/bin/bash

# 设置系统源为中国区域，并更新系统
sudo pacman-mirrors -i -c China -m rank && pacman -Syyu

# 设置下载仓库源
cat >> /etc/pacman.conf << EOF
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch
EOF

sudo pacman -S archlinuxcn-keyring

## 安装搜狗输入法
sudo pacman -S fcitx-sogoupinyin
sudo pacman -S fcitx-im
sudo pacman -S fcitx-configtool
cat >> ~/.xprofile << EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=”@im=fcitx”
EOF

## 要是出现错误为：搜狗输入法异常！请删除.config/SogouPY 并重启，则执行sudo pacman -S fcitx-qt4

## markdown编辑器
sudo pacman -S typora
##chrome浏览器
sudo pacman -S google-chrome
##vscode
sudo pacman -S visual-studio-code-bin
##深度截图
sudo pacman -S deepin-screenshot	
## shadowsock
sudo pacman -S shadowsock-qt5
## 下载器
sudo pacman -S uget

### Q&A
# 1) manjaro更新后，中文显示为方框：sudo pacman -S wqy-microhei
#2)  