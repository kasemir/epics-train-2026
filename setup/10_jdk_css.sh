cd $HOME/training/tools

echo "== MVN"
rm -rf apache-maven
wget https://dlcdn.apache.org/maven/maven-3/3.9.11/binaries/apache-maven-3.9.11-bin.zip
unzip apache-maven-*.zip
rm apache-maven-*.zip
mv apache-maven-* apache-maven

export M2_HOME=$HOME/training/tools/apache-maven
export PATH="$M2_HOME/bin:$PATH"
mvn -version


echo "== CS-Studio phoebus"
rm -rf phoebus
git clone https://github.com/ControlSystemStudio/phoebus.git
cd phoebus

# JFX 21.0.7 doesn't include aarch64
# 24.0.2 does, but it's on a GLIBC that's too new
sed -i 's/openjfx.version>21.0.7/openjfx.version>22.0.2/g' pom.xml

rm -rf .git
mvn -DskipTests clean install

phoebus-product/phoebus.sh -help
rm -rf ~/.m2


