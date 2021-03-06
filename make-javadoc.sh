rm -rf javadoc

mkdir  -p javadoc

project_version=$(mvn org.apache.maven.plugins:maven-help-plugin:2.1.1:evaluate -Dexpression=project.version | egrep -v '^\[|Downloading:' | sed 's/[^0-9\.]//g' | awk 1 ORS='')

javadoc -bottom '<p><i>Kafka and Zookeeper and other names and brands may be claimed as the property of others</i></p>' -sourcepath ./src/main/java/ -subpackages com/mcafee/dxl/streaming/operations/client -d ./javadoc -classpath ./target/msdk4kafka-${project_version}-jar-with-dependencies.jar
