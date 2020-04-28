FROM python:3
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
ENV FLASK_RUN app.py
CMD flask run --host=0.0.0.0 --port=$FLASK_PORT
EXPOSE 5004

