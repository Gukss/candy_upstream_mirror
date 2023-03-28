# base image
FROM python:3.9.10

# set working directory
# WORKDIR /app

# copy requirements file
COPY requirements.txt .

# install requirements
RUN pip install --no-cache-dir -r requirements.txt

# copy application files
COPY . .

# expose port
EXPOSE 90

# start application
CMD ["flask", "run", "--host=0.0.0.0"]
