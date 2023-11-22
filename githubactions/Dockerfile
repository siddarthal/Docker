FROM docker:latest
WORKDIR /usr/src/app 
COPY scripth.sh .
RUN chmode +x scripth.sh
ENV DOCKER_USER=""
ENV DOCKER_PWD=""
ENTRYPOINT [ "./scripth.sh" ]







# docker run -e DOCKER_USER=mluukkai -e DOCKER_PWD=password_here -v /var/run/docker.sock:/var/run/docker.sock builder mluukkai/express_app mluukkai/testing2