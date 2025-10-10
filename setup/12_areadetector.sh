echo "== Area Detector"

sudo dnf install -y zlib-devel

cd /ics/training/tools

wget https://github.com/areaDetector/areaDetector/archive/refs/tags/R3-11.zip
unzip R3-11.zip
rm R3-11.zip
mv areaDetector-R3-11 areaDetector

wget https://github.com/areaDetector/ADCore/archive/refs/tags/R3-11.zip
unzip R3-11.zip
mv ADCore-R3-11/* areaDetector/ADCore
rm R3-11.zip
rm -rf ADCore-R3-11

wget https://github.com/areaDetector/ADSupport/archive/refs/tags/R1-10.zip
unzip R1-10.zip
mv ADSupport-R1-10/* areaDetector/ADSupport/
rm -rf ADSupport-R1-10
rm R1-10.zip

wget https://github.com/areaDetector/ADSimDetector/archive/R2-10.zip
unzip R2-10.zip 
mv ADSimDetector-R2-10/* areaDetector/ADSimDetector/
rm -rf ADSimDetector-R2-10/
rm R2-10.zip 

wget https://github.com/areaDetector/pvaDriver/archive/refs/tags/R1-5.zip
unzip R1-5.zip
rm R1-5.zip
mv pvaDriver-R1-5/* areaDetector/pvaDriver/
rm -rf pvaDriver-R1-5

cd areaDetector
(cd configure; ./copyFromExample)
cp /ics/training/setup/areadetector_configure/* configure

make

