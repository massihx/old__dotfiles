#!/bin/bash
############################
# .makesymlinks.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/OneDrive/settings/dotfiles  # dotfiles directory
olddir=~/dotfiles-backup          # old dotfiles backup directory
files="bash_profile bash_prompt bashrc brew exports aliases functions osx path"                   # list of files/folders to symlink in homedir
script="${0##*/}"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/.$file ~/.$file
done
