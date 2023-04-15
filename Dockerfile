FROM python:3.9
WORKDIR /blacklist
ENV FLASK_APP=src/blacklist.py
ENV FLASK_DEBUG=1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN apt-get update && apt-get install -y netcat
RUN pip install --upgrade pip
COPY . /blacklist
RUN pip install -r requirements.txt
ENTRYPOINT ["sh","/blacklist/entrypoint.sh"]