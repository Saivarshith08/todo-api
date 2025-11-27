# Use official Python slim image
FROM python:3.10-slim

# set workdir
WORKDIR /app

# env
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install system deps
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential && rm -rf /var/lib/apt/lists/*

# copy requirements first for better caching
COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /app/requirements.txt

# copy project
COPY . /app

# create a non-root user (optional)
RUN useradd -m appuser && chown -R appuser /app
USER appuser

WORKDIR /app/app

EXPOSE 5000

# initialize db and start gunicorn
CMD ["sh", "-c", "python init_db.py && gunicorn -w 4 -b 0.0.0.0:5000 app:app"]