echo "== PyDevice"

cd /ics/tools
rm -rf pydevice
wget https://github.com/klemenv/PyDevice/archive/refs/tags/R1.1.1.tar.gz
tar vzxf R1*.tar.gz
rm R1*.tar.gz
mv PyDevice-* pydevice
cd pydevice

# Adjust PYTHON_CONFIG=python3-config in configure/CONFIG_SITE?

ln -snfr ../RELEASE.local configure/
make
echo PYDEVICE=`pwd` >>../RELEASE.local 
cd ..

