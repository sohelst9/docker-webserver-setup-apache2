#use the ubuntu image 
FROM ubuntu

#update package repository
RUN apt-get update

#install apache
RUN apt-get install -y apache2

#Install apache2-utils package
RUN apt-get install -y apache2-utils

#Cleans up the local repository of retrieved package files to reduce the image size
RUN apt-get clean

#copy the index.php file to the web root
COPY index.html /var/www/html/

# Expose port 80 to allow incoming HTTP traffic to the container
EXPOSE 80

#Start the Apache server in the foreground mode, ensuring the container remains running
CMD ["apache2ctl", "-D", "FOREGROUND"]