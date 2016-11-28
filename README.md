# Montage Master 2 FE Genie Electrique : robotBeagleBone
Par Christian Lafforgue, Yann Labbée et Pierre-Louis Guhur

## Installation
- lancement du serveur web :
cc nwebCGI.c -o nweb
chmod 777 nweb
./nweb 8181 .
- initialisation du robot :
./initialisation.sh
- noter l'IP : 
 ip addr show eth0

## Sur un client web (par exemple Google Chrome)
http://[ip]:8181
