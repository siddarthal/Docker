$ docker login

Next, you will need to rename the image to include your username, and then you can push it:

$ docker tag youtube-dl <username>/<repository> ....
  ...

$ docker push <username>/<repository> .....



sudo lsof -i :80
