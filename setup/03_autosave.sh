echo "== autosave"
cd $HOME/training/tools
rm -rf autosave
git clone https://github.com/epics-modules/autosave.git
cd autosave
rm -rf .git
make
echo "AUTOSAVE="`pwd` >> ../RELEASE.local
cd ..

