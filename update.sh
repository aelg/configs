#!/bin/bash


cp ~/.bashrc ./
cp ~/.inputrc ./
cp ~/.vimrc ./
cp ~/.tmux.conf ./
cp ~/.xmobarrc ./
cp ~/.Xmodmap ./
cp ~/.xmonad/xmonad.hs ./
cp ~/.Xresources ./

git add -p
