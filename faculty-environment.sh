#!/bin/bash

echo "Copying performance environment variables file to /etc/faculty_environment..."
echo LD_LIBRARY_PATH=$PWD/examples:'$LD_LIBRARY_PATH' | sudo tee /etc/faculty_environment.d/performance_envs.sh

echo "CD into install-boost..."
TMP_DIR=$(pwd)
cd install-boost

echo "Installing Boost..."
source install_boost.sh

echo "Copying environment variables file to /etc/faculty_environment.d ..."
cp envs.sh /etc/faculty_environment.d/boost_envs.sh

echo "Restarting Jupyter..."
sudo sv stop jupyter && sudo sv start jupyter

echo "Step back..."
cd $TMP_DIR 
unset TMP_DIR

echo "Done."
