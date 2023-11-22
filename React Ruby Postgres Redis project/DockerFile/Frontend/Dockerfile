FROM node:16-alpine
WORKDIR /usr/src/app
COPY package*.json .
RUN npm  install
COPY . .
# ENV REACT_APP_BACKEND_URL=http:<backend url>:<backend port>  or
ENV REACT_APP_BACKEND_URL=ip/api  
# after doing reverse proxy
RUN npm run build
RUN npm install -g serve
EXPOSE 5000
ENTRYPOINT ["serve","-s","-l","5000","build"]


