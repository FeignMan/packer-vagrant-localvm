# Install Node.js and NPM
curl -sL https://rpm.nodesource.com/setup_4.x | sudo -E bash -
# make sure nodejs is installed from nodesource repo; e.g. epel repo might have a different version.
sudo yum -y --disablerepo="*" --enablerepo=nodesource install nodejs

# Install Python 2.7.6
wget http://python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz
xz -d Python-2.7.6.tar.xz
tar -xvf Python-2.7.6.tar
cd Python-2.7.6
./configure --prefix=/home/vagrant/.python2.7
make
make altinstall
echo 'export PATH="$HOME/.python2.7/bin:$PATH"' >> ~/.bashrc
echo 'export BINDIR="$HOME/.python2.7/bin"' >> ~/.bashrc
. ~/.bashrc
cd

# Install Python 2.7.6 setuptool & pip
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz
tar -xvf setuptools-1.4.2.tar.gz
cd setuptools-1.4.2
python2.7 setup.py install
curl https://bootstrap.pypa.io/get-pip.py | python2.7 -
pip install pyopenssl ndg-httpsclient pyasn1
pip install virtualenv
cd

# Install DynamoDBLocal
mkdir DynamoDBLocal
cd DynamoDBLocal/
wget http://dynamodb-local.s3-website-us-west-2.amazonaws.com/dynamodb_local_latest.tar.gz
tar -zxvf dynamodb_local_latest.tar.gz
cd

# Install aws-cli
pip install awscli
# configure aws-cli for local usage
mkdir ~/.aws
echo "[default]" >> ~/.aws/credentials
echo "aws_access_key_id=foo" >> ~/.aws/credentials
echo "aws_secret_access_key=bar" >> ~/.aws/credentials
echo "region=local" >> ~/.aws/credentials