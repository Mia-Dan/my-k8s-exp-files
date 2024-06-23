#! /bin/bash
# tmp version

# prep exp files
cd ~
git clone https://github.com/Mia-Dan/my-k8s-exp-files.git\
# or in dir
# git pull

# deploy
cd ~/my-k8s-exp-files/ && ls
k apply -f pod-run-cpu.yaml
k apply -f svc-run-cpu.yaml
# watch kubectl get po
sleep 30
curl http://172.30.1.2:30084/cpu/1

# install jdk
# TODO: check if java exist, JAVA_HOME exist, see backlog 0623-1
apt install openjdk-17-jdk -y
# java -version
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"

# install jmeter
cd ~ 
wget https://dlcdn.apache.org//jmeter/binaries/apache-jmeter-5.6.3.tgz && ls
tar zxvf apache-jmeter-5.6.3.tgz

~/apache-jmeter-5.6.3/bin/jmeter.sh -n --help

# run exp
cd ~/my-k8s-exp-files/ && ls
~/apache-jmeter-5.6.3/bin/jmeter.sh -n -t "/root/my-k8s-exp-files/for-cpu.jmx"
# summary =      5 in 00:00:10 =    0.5/s Avg:  5593 Min:  2021 Max:  9193 Err:     0 (0.00%)
# 运行下一行docker后,
# summary =      5 in 00:00:09 =    0.6/s Avg:  4880 Min:  1728 Max:  7930 Err:     0 (0.00%)
# k8s情况下,如果输入错了端口号,反应会慢

# sup-exp in docker, without k8s
docker run -p 8084:8084 miadan/exp-run-cpu:0.0.0
vim for-cpu.jmx # edit the url
# summary =      5 in 00:00:14 =    0.4/s Avg:  8231 Min:  2771 Max: 13340 Err:     0 (0.00%)
# summary =      5 in 00:00:12 =    0.4/s Avg:  7077 Min:  2676 Max: 11266 Err:     0 (0.00%)
# docker情况下,如果输入错了端口号,会很快反应
# summary =      5 in 00:00:01 =    5.9/s Avg:    29 Min:     4 Max:    66 Err:     5 (100.00%)

#---
#
#which java
#
#is this the same as...
#
#type -p java ?
#
#controlplane $ type --help
#type: type [-afptP] name [name ...]
#    Display information about command type.
#
#    For each NAME, indicate how it would be interpreted if used as a
#    command name.
#
#    Options:
#      -a        display all locations containing an executable named NAME;
#                includes aliases, builtins, and functions, if and only if
#                the `-p' option is not also used
#      -f        suppress shell function lookup
#      -P        force a PATH search for each NAME, even if it is an alias,
#                builtin, or function, and returns the name of the disk file
#                that would be executed
#      -p        returns either the name of the disk file that would be executed,
#                or nothing if `type -t NAME' would not return `file'
#      -t        output a single word which is one of `alias', `keyword',
#                `function', `builtin', `file' or `', if NAME is an alias,
#                shell reserved word, shell function, shell builtin, disk file,
#                or not found, respectively
#
#    Arguments:
#      NAME      Command name to be interpreted.
#
#    Exit Status:
#    Returns success if all of the NAMEs are found; fails if any are not found.