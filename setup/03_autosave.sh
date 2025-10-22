echo "== autosave"
cd /ics/tools
rm -rf autosave
# git clone https://github.com/epics-modules/autosave.git
wget https://github.com/epics-modules/autosave/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
mv autosave-master autosave
cd autosave
make
echo "AUTOSAVE="`pwd` >> ../RELEASE.local
cd ..
cat RELEASE.local


