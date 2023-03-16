# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port that the application will be running on
EXPOSE 8000

# Run the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
