FROM ubuntu:latest
RUN apt update && apt install python:3.10
WORKDIR /usr/src/app
COPY . .
RUN python3 install pip
RUN pip install -r requirements.txt
EXPOSE 3000
ENV FRONTEND_URL=http://<ip>:<port>
CMD
