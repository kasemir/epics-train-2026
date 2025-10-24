echo "== P4P"

cd /ics/tools
rm -rf p4p
wget https://github.com/epics-base/p4p/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv p4p-master p4p
cd p4p
python3 -m pip install -r requirements-latest.txt
make
# In the generated pvagw, may have to change '#!/usr/bin/python'
# to use .../python3

rm -f /ics/bin/pvagw
ln -s `pwd`/bin/*/pvagw /ics/bin

export PYTHONPATH=`echo /ics/tools/p4p/python*/linux-*`
python -c 'import p4p'


