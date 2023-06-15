# DELTA TASK 2

# Viewing Mess.txt

cd to scripts/apache

RUN

docker build -t apache_server .

docker run -p 8080:80 -d --name apache apache_server

and on the website http://gamma-z.hm:8080/

mess.txt would be visible
# Adding a Cronjob:

Start the mysql docker container 

cd to server and run docker compose up

Change the name of docker container

Run crontab -e and update the file by adding the below piece of code

10 10 */3 5,6,8 0 docker exec name-of-docker-container sh -c 'exec mysqldump db -uroot -p"root"' > /home/aaditkrishnaar/Desktop/databases2.sql

Change the absolute path of databases2.sql in the host machine



# Adding Volumes
  
cd to the server directory
Run the following commands

mkdir backup
chmod -R 777 backup/

Now while doing docker compose up data would be located in backup directory in host machine

# PHPMyAdmin

After executing docker compose up and waiting for 100s ( sorry on this part )

Open the browser and enter localhost:9000/

Enter server name as mysql
user : root
password : root 

Inside Student Details would be visible