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
watch kubectl get po
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