FROM python:3

ADD web.py /

RUN pip install requirements.txt

CMD ["python","./web.py"]

EXPOSE 5000
