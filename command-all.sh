#command='
#cd /etc/ld.so.conf.d;
#sudo touch hdfs.conf;
#sudo chmod 777 hdfs.conf;
#sudo echo '/usr/lib/jvm/java-8-oracle/jre/lib/amd64/server' >> hdfs.conf;
#sudo echo '/home/ubuntu/hadoop/c++/Linux-amd64-64/lib' >> hdfs.conf;
#sudo ldconfig -v'
command='mkdir /home/grape/graphlab_data'
echo $command
for i in {1..9};
do
	ssh aws0$i $command
done
for j in {10..20};
do
	ssh aws$j $command
done
