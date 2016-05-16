#!/bin/bash
############################
# install.sh
# This script creates symlinks to ~/bin from any files in the current dir
############################

########## Variables

dir=~/bin                   				# local bin dir
olddir=~/.bin_old             			# old bin dir backup directory
files="smnt slpr curie-backup.sh pass_export.sh"    # list of files/folders to symlink in homedir
wd=$(pwd)

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing files in $dir ..."
mkdir -p $olddir
echo "done"

# change to the bin directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing files in ~/bin to bin_old directory, then create symlinks from ~/bin to any files in the ~/bin directory specified in $files
echo "Moving any existing files from $dir to $olddir"
for file in $( ls ~/bin ); do
	echo "Moving $file"
	mv $dir/$file $olddir
done

echo "Linking files from from $wd to $dir"
cd $wd
for file in $files; do
	echo "Creating symlink to $file in $dir."
	ln -s $wd/$file $dir/$file
done
