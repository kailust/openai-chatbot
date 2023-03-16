# Chatbot Web App
This is a simple web app that uses the Hugging Face Transformers library to generate responses to user input using a pre-trained language model. The app is built with Flask and can be run locally or deployed to a server.

## Installation
To run the app locally, you need to have Python 3.9 and pip installed on your system. You can then install the required Python packages by running the following command in the project directory:

```
pip install -r requirements.txt
```
This will install Flask, Transformers, and Torch, along with their dependencies.

## Usage
To run the app locally, simply run the following command in the project directory:

```
python app.py
```
This will start the Flask development server on http://localhost:5000. You can then visit this URL in your web browser to access the chatbot interface.

## Deployment
To deploy the app to a server, you can use Docker. First, you need to build the Docker image by running the following command in the project directory:

```
docker build -t chatbot-app .
```
This will build the Docker image and tag it with the name chatbot-app. You can then run the app inside a Docker container using the following command:

```
docker run -p 8000:8000 chatbot-app
```
This will start the Gunicorn server inside a Docker container and map port 8000 on the host to port 8000 inside the container. You can then access the app by visiting http://localhost:8000 in your web browser.

Acknowledgments
This project was built using the following open source libraries:

Flask
Transformers
Torch
License
This project is licensed under the MIT License - see the LICENSE file for details.