FROM python:3
RUN mkdir /app
WORKDIR /app
COPY requirements.txt /app
RUN pip install -r requirements.txt
COPY app.py /app
COPY static/ /app/static
COPY templates/ /app/templates
ENV FLASK_RUN app.py
ENV FLASK_PORT 5004
CMD flask run --host=0.0.0.0 --port=$FLASK_PORT
EXPOSE 5004

