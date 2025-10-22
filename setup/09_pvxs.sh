echo "== PVXS"

cd /ics/tools
rm -rf pvxs
wget https://github.com/epics-base/pvxs/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv pvxs-master pvxs
cd pvxs
make
echo "PVXS=`pwd`" >> ../RELEASE.local

for cmd in pvxcall pvxget pvxinfo pvxlist pvxmonitor pvxput softIocPVX
do
    ln -s `pwd`/bin/*/$cmd ../../bin
done

pvxinfo -h


