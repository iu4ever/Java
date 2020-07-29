ping -c 4 www.baidu.com
systemctl restart network
vi  /etc/sysconfig/network-scripts/ifcfg-ens33
ipconfig /all
ls --help  ls --help
man  ls   man ls
Tab 


1:查看防火状态

systemctl status firewalld

service  iptables status

2:暂时关闭防火墙

systemctl stop firewalld

service  iptables stop

3:永久关闭防火墙

systemctl disable firewalld

chkconfig iptables off

4:重启防火墙

systemctl enable firewalld

service iptables restart  

5:永久关闭后重启

//暂时还没有试过


如果要退出bash有2种操作：1）Ctrl + d 退出并停止容器；2）Ctrl + p + q 退出并在后台运行容器； 

docker run -d -p 8888:8080 --privileged=true -v /root/tomcat/:/usr/local/tomcat/webapps/ tomcat
docker run -v /home/redis/redis.conf:/usr/local/etc/redis/redis.conf --name redis2 --privileged=true redis  redis-server /usr/local/etc/redis/redis.conf

docker exec -it bc93a1e6df64123a999a09320f5ced38098e3ae5cc2eef35db652cbf539ca648 /bin/bash
rm -rf webapps
mv webapps.dist webapps




