#!/bin/bash
cd /workspace

echo "🔧 Activating Python venv..."
python3 -m venv venv
source venv/bin/activate

echo "📦 Installing dependencies..."
pip install flask python-dotenv huggingface_hub ipywidgets hf_transfer torch torchvision torchaudio

echo "🚀 Starting ComfyUI..."
cd /workspace/ComfyUI
python3 main.py --listen 0.0.0.0 --port 8188 &

echo "📒 Launching JupyterLab..."
cd ~
jupyter lab --ip=0.0.0.0 --port=8888 --allow-root --no-browser &

echo "🧠 Launching LLM Chat API..."
cd /workspace
python3 ariwhispers_chat_api.py &
