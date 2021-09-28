# Use the official Alpine Python base image
FROM python:@{PYTHON_VERSION}-alpine


# Set Environment variables
ARG FLASK_ENV=@{DEFAULT_ENV}
ENV FLASK_ENV=${FLASK_ENV}
ENV FLASK_APP=@{APP_NAME}


# Set the app directory
WORKDIR /app


# Install dependencies
COPY @{REQUIREMENTS_FILE} @{REQUIREMENTS_FILE}
RUN pip3 install -r @{REQUIREMENTS_FILE}


# Copy app source
COPY . .


# Start app
EXPOSE @{PORT}
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
