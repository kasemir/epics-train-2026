echo "== Creating training/tools"
mkdir -p $HOME/training/tools
cd $HOME/training/tools

echo "== EPICS base"
rm -rf base
wget https://epics.anl.gov/download/base/base-7.0.9.tar.gz
tar vzxf base-7.0.9.tar.gz
rm base-7.0.9.tar.gz
mv base-7.0.9 base
cd base
make
echo "EPICS_BASE="`pwd` > ../RELEASE.local
cd ..

