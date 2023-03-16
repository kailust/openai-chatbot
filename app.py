from flask import Flask, request, jsonify
from transformers import pipeline, set_seed, OpenAIGPTTokenizer, OpenAIGPTModel
import torch

# Initialize the Flask application
app = Flask(__name__)

# Load the pre-trained OpenAI GPT model and tokenizer
tokenizer = OpenAIGPTTokenizer.from_pretrained("openai-gpt")
model = OpenAIGPTModel.from_pretrained("openai-gpt")

# Set the seed for reproducible results
set_seed(42)

# Define a text generation pipeline using the OpenAI GPT model
generator = pipeline('text-generation', model=model, tokenizer=tokenizer)

# Define the route for the chatbot interface
@app.route('/', methods=['POST'])
def chatbot():
    # Get the user input from the request
    user_input = request.json['input']
    
    # Generate a response using the text generation pipeline
    response = generator(user_input, max_length=30, num_return_sequences=1)[0]['generated_text']
    
    # Return the response as JSON
    return jsonify({'response': response})

# Run the Flask application
if __name__ == '__main__':
    app.run(debug=True)
