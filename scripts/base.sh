yum -y update
yum -y install kernel-devel gcc make gcc-c++ perl wget dos2unix screen

yum groupinstall -y development
yum -y install bzip2-devel ncurses-devel openssl-devel readline-devel sqlite-devel tk-devel zlib-devel libffi-devel cairo-devel libjpeg-turbo-devel libgif-dev giflib-devel epel-release
yum -y install java-1.8.0-openjdk.x86_64 java-1.8.0-openjdk-devel.x86_64
yum -y install ImageMagick

echo "[mongodb-org-3.4]" >> /etc/yum.repos.d/mongodb-org-3.4.repo
echo "name=MongoDB 3.4 Repository" >> /etc/yum.repos.d/mongodb-org-3.4.repo
echo "baseurl=https://repo.mongodb.org/yum/redhat/7/mongodb-org/3.4/x86_64/" >> /etc/yum.repos.d/mongodb-org-3.4.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/mongodb-org-3.4.repo
echo "enabled=1" >> /etc/yum.repos.d/mongodb-org-3.4.repo
echo "gpgkey=https://www.mongodb.org/static/pgp/server-3.4.asc" >> /etc/yum.repos.d/mongodb-org-3.4.repo

read -rsp $'Press enter to proceed with mongodb install...\n'
yum install -y mongodb-org

# Edit mongod.conf to set bind_ip=0.0.0.0, to accept all inbound connections
sed -i "/^bind_ip=127.0.0.1/s/127.0.0.1/0.0.0.0/g" /etc/mongod.conf

# install redis
REDIS_VERSION=3.2.10-2.el7
yum install -y redis-$REDIS_VERSION
sudo chmod +r /etc/redis.conf
echo "appendonly yes" | sudo tee -a /etc/redis.conf > /dev/null
echo "appendfsync everysec" | sudo tee -a /etc/redis.conf > /dev/null
sudo systemctl enable redis

cd /etc/yum.repos.d
wget http://www.graphviz.org/graphviz-rhel.repo
read -rsp $'Press enter to install graphviz-rhel...\n'

sudo yum install graphviz.i686  -y

#	A simple reboot doesn't work in packer v1.1.0
#	-	sshd.service needs to be stopped first
#	-	'nohup shutdown -r' should be used in place of reboot
#	-	'expect_disconnect' needs to be set in the provisoner options in the packer script
#	More info here: https://github.com/hashicorp/packer/issues/4684
systemctl stop sshd.service
nohup shutdown -r now < /dev/null > /dev/null 2>&1 &
exit 0