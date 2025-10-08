echo "## EPICS V4 Sandbox"
cd ~/training/tools
rm -rf EPICSV4Sandbox
wget https://github.com/kasemir/EPICSV4Sandbox/archive/refs/heads/master.zip
unzip master.zip 
rm master.zip 
mv EPICSV4Sandbox-master EPICSV4Sandbox
cd EPICSV4Sandbox/neutronsDemoServer
make
cd ../ntndarrayServer
make
cd ..

# ntndarrayServer/bin/linux-aarch64/ntndarrayServerMain IMAGE
# neutronsDemoServer/bin/linux-aarch64/neutronServerMain -r

