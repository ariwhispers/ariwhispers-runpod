from flask import Flask, request, jsonify
import os
from dotenv import load_dotenv

load_dotenv()
app = Flask(__name__)
PORT = int(os.getenv("LLM_PORT", 5000))

@app.route('/chat', methods=['POST'])
def chat():
    user_input = request.json.get("message", "")
    return jsonify({"response": f"Ari would say something sweet in response to: {user_input}"})

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=PORT)
