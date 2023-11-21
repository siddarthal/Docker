$ docker login

Next, you will need to rename the image to include your username, and then you can push it:

$ docker tag youtube-dl <username>/<repository> ....
  ...

$ docker push <username>/<repository> .....

when we try reverse proxy nginx reverse proxy there might be something running on port 80
to check this out use this command...

$ sudo lsof -i :80

to remove it temporarily use the following command

sudo service apache2 stop

to restart it use

sudo service apache2 start
