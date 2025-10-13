echo "== Busy"
cd /ics/training/tools/
rm -rf busy

wget https://epics.anl.gov/bcda/synApps/tar/busy_R1-6-1.tar.gz
tar vzxf busy_R1-6-1.tar.gz
rm busy_R1-6-1.tar.gz
mv busy-1-6-1 busy

cd busy
echo '-include $(TOP)/../RELEASE.local' >configure/RELEASE
make
echo "BUSY=`pwd`" >> ../RELEASE.local

