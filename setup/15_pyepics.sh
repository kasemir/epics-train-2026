echo "== PyEpics"

cd /ics/training/tools
rm -rf pyepics
wget https://github.com/pyepics/pyepics/archive/refs/tags/3.5.0.zip
unzip 3.5.0.zip 
rm 3.5.0.zip 
mv pyepics-* pyepics
cd pyepics
python3 setup.py build
cd ..
