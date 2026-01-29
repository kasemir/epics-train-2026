echo "== Busy"
cd /ics/tools/
rm -rf busy

wget https://github.com/epics-modules/busy/archive/refs/tags/R1-7-4.zip
unzip R1-7-4.zip
rm R1-7-4.zip
mv busy-R* busy

cd busy
echo '-include $(TOP)/../RELEASE.local' >configure/RELEASE
make
echo "BUSY=`pwd`" >> ../RELEASE.local
cat ../RELEASE.local


