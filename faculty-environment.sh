#!/bin/bash

echo "Copying performance environment variables file to /etc/faculty_environment..."
echo LD_LIBRARY_PATH=$PWD/examples:'$LD_LIBRARY_PATH' | sudo tee /etc/faculty_environment.d/performance_envs.sh

echo "CD into install-boost..."
pushd install-boost

echo "Installing Boost..."
source install_boost.sh

echo "Copying environment variables file to /etc/faculty_environment.d ..."
cp boost_envs.sh /etc/faculty_environment.d/boost_envs.sh

echo "Restarting Jupyter..."
sudo sv restart jupyter

echo "Step back..."
popd

echo "Done."
