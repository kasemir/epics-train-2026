echo "== vdct"
cd ~/training/tools
rm -rf vdct
wget https://github.com/epics-extensions/VisualDCT/releases/download/v2.8.3/VisualDCT-2.8.3-distribution.tar.gz
tar vzxf VisualDCT-*-distribution.tar.gz
rm VisualDCT-*-distribution.tar.gz
mv VisualDCT-* vdct
