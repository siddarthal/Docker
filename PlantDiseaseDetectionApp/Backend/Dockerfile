FROM ubuntu:latest
RUN apt update && apt install -y python3.10
WORKDIR /usr/src/app
COPY . .
RUN apt install -y python3-pip
RUN pip3 install -r requirements.txt
EXPOSE 3000
ENV FRONTEND_URL=http://<ip>:<port>
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "3000"]
