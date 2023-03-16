# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Upgrade pip and install Rust compiler and C compiler toolchain
RUN apt-get update && apt-get install -y curl build-essential && \
    curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    export PATH="$HOME/.cargo/bin:$PATH" && \
    pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose the port that the application will be running on
EXPOSE 8000

# Run the application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]
