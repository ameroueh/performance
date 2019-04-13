echo "Downloading Boost..."
wget https://dl.bintray.com/boostorg/release/1.69.0/source/boost_1_69_0.tar.gz --directory-prefix=/tmp

echo "Extracting Boost..."
tar -xvf /tmp/boost_1_69_0.tar.gz -C /tmp

echo "Creating environment variables file..."
python create_envs_file.py /tmp/boost_1_69_0

echo "Sourcing environment variables..."
source boost_envs.sh

echo "CD into /tmp/boost_1_69_0"
cp patch_boost_project_config.py /tmp/boost_1_69_0
cd /tmp/boost_1_69_0 

echo "Bootstrapping Boost..."
./bootstrap.sh

echo "Patching Boost project file..."
python patch_boost_project_config.py /tmp/boost_1_69_0/project-config.jam  

echo "Building Boost Python libraries..."
./b2 install --with-python stage

echo "Step back..."
cd -

echo "Done."
