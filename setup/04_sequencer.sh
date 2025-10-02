echo "== sequencer"
cd $HOME/training/tools
rm -rf sequencer R2-2-9
wget https://github.com/epics-modules/sequencer/archive/refs/tags/R2-2-9.tar.gz
tar vzxf R2-2-9.tar.gz
rm R2-2-9.tar.gz
mv sequencer-R2-2-9 sequencer
cd sequencer
make
echo "SNCSEQ="`pwd` >> ../RELEASE.local
cd ..

