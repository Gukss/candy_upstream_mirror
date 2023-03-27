# base image
FROM python:3.9.10

# set working directory
WORKDIR /app

# copy requirements file
COPY requirements.txt .

# install requirements
RUN pip install --no-cache-dir -r requirements.txt

# copy application files
COPY app.py .
COPY templates templates/

# set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# expose port
EXPOSE 90

# start application
CMD ["flask", "run", "--host=0.0.0.0"]