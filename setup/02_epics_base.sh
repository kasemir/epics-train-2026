echo "== Creating /ics/tools"
mkdir -p /ics/tools
cd /ics/tools

echo "== EPICS base"
rm -rf base
wget https://epics.anl.gov/download/base/base-7.0.9.tar.gz
tar vzxf base-7.0.9.tar.gz
rm base-7.0.9.tar.gz
mv base-7.0.9 base
cd base
make
echo "EPICS_BASE="`pwd` > ../RELEASE.local

for cmd in ascheck caget cainfo camonitor caput casw makeBaseApp.pl pvget pvinfo pvlist pvmonitor pvput softIoc softIocPVA
do
    ln -s `pwd`/bin/*/$cmd ../../bin
done

cd ..

