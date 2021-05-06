FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN pip freeze > requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "gunicorn", "--bind", "0.0.0.0:5000", "app:app" ]
