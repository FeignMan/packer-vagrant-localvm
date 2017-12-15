GS_PATH=~/wks_gs/

# npm install global packages
# npm install -g bower
# npm install -g grunt-cli
# npm install -g nodemon
npm install -g jshint
# npm install -g jscs
npm install -g apidoc
npm install -g mocha
npm install -g node-inspector
npm install -g pm2

# DynamoDbLocal
cd ~/DynamoDBLocal
java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb &

npm install aws-sdk

kill `pidof java`

# Update vagrant user environment
# echo "export ENV=${1}" >> /home/vagrant/.bash_profile
# echo "export NODE_ENV=${1}" >> /home/vagrant/.bash_profile
# . ~/.bash_profile
