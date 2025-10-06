echo "== Asyn"
cd ~/training/tools/
rm -rf asyn

# Earlier releases need rpcgen and libtirpc-devel, which
# fails to install for Rocky 9.6?!
# Latest as of Oct. 2025 defaults to skipping VXI11/RPC
wget https://github.com/epics-modules/asyn/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv asyn-master asyn
cd asyn/
sed -i 's/^SUPPORT=/# SUPPORT=/' configure/RELEASE
make
echo "ASYN=`pwd`" >> ../RELEASE.local

