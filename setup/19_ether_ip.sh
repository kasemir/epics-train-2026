echo "== ether_ip"
# ether_ip for Allen Bradley PLCs

cd /ics/tools/
rm -rf ether_ip

wget https://github.com/epics-modules/ether_ip/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv ether_ip-master ether_ip
cd ether_ip

make
echo "ether_ip=`pwd`" >> ../RELEASE.local
cat ../RELEASE.local

for cmd in eipIoc ether_ip_test
do
  ln -s `pwd`/bin/*/$cmd ../../bin
done

