cd /ics/tools

echo "== MVN"
rm -rf apache-maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip
unzip apache-maven-*.zip
rm apache-maven-*.zip
mv apache-maven-* apache-maven

export M2_HOME=/ics/tools/apache-maven
export PATH="$M2_HOME/bin:$PATH"
mvn -version


echo "== CS-Studio phoebus"
rm -rf phoebus
# git clone https://github.com/ControlSystemStudio/phoebus.git
wget https://github.com/ControlSystemStudio/phoebus/archive/refs/heads/master.zip
unzip master.zip
rm master.zip
mv phoebus-master phoebus

cd phoebus

# JFX 21.0.7 doesn't include aarch64
# 24.0.2 does, but it's on a GLIBC that's too new
# -> fall back to 22.0.2
sed -i 's/openjfx.version>21.0.7/openjfx.version>22.0.2/g' pom.xml

mvn -DskipTests clean install
# Remove jackie: Not used, causes startup delay calling 'hostname'
rm phoebus-product/target/lib/core-pv-jackie-*
# For now remove CF, we don't have elastic etc. available
rm phoebus-product/target/lib/app-channel*

phoebus-product/phoebus.sh -help

# Save disk space by cleaning Maven repo
rm -rf ~/.m2

