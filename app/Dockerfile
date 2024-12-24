FROM python:3.12
WORKDIR /app
COPY . .
RUN pip install --no-index -f dependencies -r requirements.txt

# https://stackoverflow.com/questions/62343455/use-asyncpg-python-module-in-alpine-docker-image