# KBsFD deploy

```bash
#install java
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
java -version

#install git


#install hadoop
mkdir -p ~/program
cd ~/program 
wget https://archive.apache.org/dist/hadoop/core/hadoop-2.2.0/hadoop-2.2.0.tar.gz
tar xvf hadoop-2.2.0.tar.gz --gzip
rm hadoop-2.2.0.tar.gz

#sync ~/.bash
source ~/.bash

#config hostname
# step: edit hosts in repo
# update repo
cp hosts /etc/hosts
# change hostname
sudo hostname awsNN

#config ssh
# local
./local-upload.sh aws.pem "~/.ssh/aws.pem"
./local-upload.sh config "~/.ssh/config"
# cluster
chmod 400 ~/.ssh/aws.pem

#hadoop deploy config
# aws01
vim $HADOOP_HOME/etc/hadoop/slaves
# deploy config
$HADOOP_HOME/bin/hadoop deployConf
# start hadoop
$HADOOP_HOME/sbin/stop_all.sh
$HADOOP_HOME/sbin/start_all.sh
```


DFS-status http://52.15.95.6:50070/dfshealth.jsp    
Hadoop-console http://52.15.95.6:8088/
