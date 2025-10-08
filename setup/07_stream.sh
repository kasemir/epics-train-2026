echo "== Stream"
cd /ics/training/tools/
rm -rf StreamDevice

wget https://github.com/paulscherrerinstitute/StreamDevice/archive/master.zip
unzip master.zip 
rm master.zip 
mv StreamDevice-master StreamDevice
cd StreamDevice
echo '-include $(TOP)/../RELEASE.local' >configure/RELEASE
make
echo "STREAM=`pwd`" >> ../RELEASE.local

