echo "== Area Detector"

sudo dnf install -y libxml2-devel
sudo dnf install -y zlib-devel

cd /ics/tools
rm -rf ADCore
wget https://github.com/areaDetector/ADCore/archive/refs/tags/R3-13.zip
unzip R3-13.zip
mv ADCore-R3-13 ADCore
rm R3-13.zip
cd ADCore
echo 'include $(TOP)/../RELEASE.local' >> configure/RELEASE
cp /ics/setup/areadetector_configure/CONFIG_SITE               configure
cp /ics/setup/areadetector_configure/commonPlugins.cmd         iocBoot
cp /ics/setup/areadetector_configure/commonPlugin_settings.req iocBoot
make
echo ADCORE=`pwd` >>../RELEASE.local
cd ..

cd /ics/tools
rm -rf ADSimDetector
wget https://github.com/areaDetector/ADSimDetector/archive/R2-11.zip
unzip R2-11.zip 
mv ADSimDetector-R2-11 ADSimDetector
rm R2-11.zip 
cd ADSimDetector
echo 'include $(TOP)/../RELEASE.local' >> configure/RELEASE
echo 'include $(TOP)/../../../RELEASE.local'   >> iocs/simDetectorIOC/configure/RELEASE
echo 'include $(ADCORE)/configure/CONFIG_SITE' >> iocs/simDetectorIOC/configure/CONFIG_SITE
if [ `uname -m` == 'aarch64' ]
then
   sed -i 's/linux-x86_64/linux-aarch64/' iocs/simDetectorIOC/iocBoot/iocSimDetector/Makefile
   sed -i 's/linux-x86_64/linux-aarch64/' iocs/simDetectorIOC/iocBoot/iocSimDetector/start_epics
fi
make
make -C iocs/simDetectorIOC
cp iocs/simDetectorIOC/iocBoot/iocSimDetector/envPaths iocs/simDetectorIOC/iocBoot/iocSimDetector/envPaths.linux

