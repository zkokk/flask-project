FROM python:3

ADD web.py /

ADD requirements.txt

RUN chmod +x requirements.txt

RUN python ./web.py && ./requirements.txt 

EXPOSE = 5000
