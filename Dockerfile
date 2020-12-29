FROM python:3

ADD web.py /

CMD ["python","Flask==1.1.1", "./web.py"]
