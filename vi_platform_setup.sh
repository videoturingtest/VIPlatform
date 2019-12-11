#! /bin/sh

# First pull down the vi_platfrom tar images
wget http://147.46.240.131/vi_platform.tar.gz

# Next unzip the files
tar xf vi_platform.tar.gz

# Then run the setup script to install and start all relevant docker containers
cd ViPlatorm
sudo sh vpp_commands.sh
cd ..

# Now remove ViPlatform folder to free up memory space
rm -rf ViPlatorm
