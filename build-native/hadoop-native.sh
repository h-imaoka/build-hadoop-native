curl -L https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VER/hadoop-$HADOOP_VER-src.tar.gz | tar -zx -C /tmp
cd /tmp/hadoop-$HADOOP_VER-src
mvn package -Pdist,native -DskipTests -Dtar
mv /tmp/hadoop-$HADOOP_VER-src/hadoop-dist/target/hadoop-$HADOOP_VER/lib/native /
# comment if you want to all results
rm -rf /tmp/hadoop-$HADOOP_VER-src
    
