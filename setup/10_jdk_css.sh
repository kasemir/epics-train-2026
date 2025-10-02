echo "== JDK"
cd $HOME/training/tools

rm -rf jdk

# For VM on newer Mac, need a aarch64 version, otherwise x64
# Hard to find durable download links
if [[ `uname -m` == "aarch64" ]]
then
    wget https://download.java.net/java/GA/jdk25/bd75d5f9689641da8e1daabeccb5528b/36/GPL/openjdk-25_linux-aarch64_bin.tar.gz
    #wget https://github.com/adoptium/temurin21-binaries/releases/download/jdk-21.0.7%2B6/OpenJDK21U-jdk_aarch64_linux_hotspot_21.0.7_6.tar.gz
else
    wget wget https://download.java.net/java/GA/jdk25/bd75d5f9689641da8e1daabeccb5528b/36/GPL/openjdk-25_linux-x64_bin.tar.gz
fi

tar zxf openjdk*
rm openjdk*
mv jdk-* jdk

export JAVA_HOME=$HOME/training/tools/jdk
export PATH="$JAVA_HOME/bin:$PATH"

java -version


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


