FROM python:latest
WORKDIR /usr/app/src
COPY app.py requirements.txt ./
RUN pip3 install -r requirements.txt
CMD [ "python3", "./app.py"]