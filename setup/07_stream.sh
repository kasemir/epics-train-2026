echo "== Stream"
cd ~/training/tools/
rm -rf StreamDevice-master

wget https://github.com/paulscherrerinstitute/StreamDevice/archive/master.zip
unzip master.zip 
rm master.zip 
cd StreamDevice-master
echo '-include $(TOP)/../RELEASE.local' >configure/RELEASE
make
echo "STREAM=`pwd`" >> ../RELEASE.local

