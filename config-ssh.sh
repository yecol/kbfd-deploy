#!/bin/bash

# keyname
keyname='~/.ssh/aws.pem'
configname = '~/.ssh/config'

# machine hostname   add hostnames to machine_array 
machine_array=(
"aws01"
"aws02"
"aws03"
"aws04"
"aws05"
"aws06"
"aws07"
"aws08"
"aws09"
"aws10"
"aws11"
"aws12"
"aws13"
"aws14"
"aws15"
"aws16"
)

cd ~
ssh-keygen -t rsa
chmod 644 .ssh/authorized_keys
chmod 400 $keyname
eval `ssh-agent`
ssh-add $keyname

for m in ${machine_array[*]}
do
    scp -i $keyname $configname ubuntu@$m:$configname
    scp -i $keyname $keyname $m:$keyname 
    cat ~/.ssh/id_rsa.pub | ssh -i $keyname ubuntu@$m  'cat >> .ssh/authorized_keys'
done
