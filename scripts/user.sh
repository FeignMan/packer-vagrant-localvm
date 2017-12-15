echo 'prefix=~/.node' >> /home/vagrant/.npmrc
echo 'registry = http://registry.npmjs.org/' >> /home/vagrant/.npmrc

echo 'export PATH="$HOME/.node/bin:$PATH"' >> /home/vagrant/.bash_profile

# echo "alias app-start='pm2 start ~/wks_gs/tools/devops/pm2/local-ecosystem.json'" >> /home/vagrant/.bash_aliases
# echo "alias app-stop='pm2 stop ~/wks_gs/tools/devops/pm2/local-ecosystem.json'" >> /home/vagrant/.bash_aliases
# echo "alias app-restart='pm2 restart ~/wks_gs/tools/devops/pm2/local-ecosystem.json'" >> /home/vagrant/.bash_aliases && source /home/vagrant/.bash_aliases
# echo "source ~/.bash_aliases" >> /home/vagrant/.bash_profile