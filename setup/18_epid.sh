echo "== EPID (std)"
# The EPID record, part of the std package

cd /ics/tools/
rm -rf std

wget https://github.com/epics-modules/std/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv std-master std
cd std/
sed -i 's/^SUPPORT=/# SUPPORT=/' configure/RELEASE

make
echo "STD=`pwd`" >> ../RELEASE.local
cat ../RELEASE.local


