# 🤖 Chat with PDF Locally Using Ollama + LangChain

A robust local RAG (Retrieval Augmented Generation) application enabling seamless interaction with your PDF documents using Ollama and LangChain. Includes a Jupyter notebook for exploration and a clean Streamlit interface for an intuitive user experience.

## ✨ Features

- 🔒 Local-first design: No data leaves your machine  
- 📄 Smart PDF processing with intelligent chunking  
- 🧠 Multi-query retrieval for better comprehension  
- 🎯 Cutting-edge RAG implementation via LangChain  
- ⚡ Real-time **response streaming** for enhanced interactivity  
- 🖥️ Streamlit-based web interface  
- 📓 Jupyter notebook for experimentation  

## 🚀 Getting Started

### Prerequisites

1. **Install Ollama**
   - Download from [Ollama's website](https://ollama.ai)
   - Pull the required models:  
     ```bash
     ollama pull llama3.2  # or any other preferred model  
     ollama pull nomic-embed-text  
     ```

2. **Clone the Repository**
   ```bash
   git clone https://github.com/Alexandre-Lalle/ollama_rag_chatbot.git
   cd ollama_rag_chatbot
   ```

3. **Set Up Environment**
   - Use Python 3.10 or higher and install dependencies:
     ```bash
     pip install -r requirements.txt
     ```

### 🎮 Running the Application

#### Option 1: Streamlit Interface
```bash
streamlit run streamlit_app.py
```
Then open your browser and navigate to:  
`http://localhost:8501`

![Streamlit UI](st_app_ui.png)  
*Streamlit interface displaying the PDF viewer and chat feature*  

#### Option 2: Jupyter Notebook
```bash
jupyter notebook
```
Open `rag_notebook.ipynb` to explore and experiment.

#### Option 3: Run with Docker
1. **Build the Docker image:**
   ```bash
   docker build -t ollama-rag-chatbot .
   ```

2. **Run the container:**
   ```bash
   docker run --name rag-chatbot-container -p 8501:8501 -e RUNNING_IN_DOCKER=true ollama-rag-chatbot
   ```

Visit `http://localhost:8501` to access the Streamlit application.


## 💡 Usage Tips

1. **Upload PDF**: Drag and drop a PDF into the Streamlit interface or use the default sample PDF.  
2. **Select Model**: Pick from the Ollama models installed locally.  
3. **Chat**: Type your questions in the chat interface to interact with the document.  
4. **Zoom Control**: Adjust the PDF's display size using the zoom slider.  
5. **Switch Documents**: Use "Delete Collection" when uploading new files.


## 🤝 Contributing

Contributions are welcome! You can:  
- Open issues for bugs or enhancements.  
- Submit pull requests with improvements.  
- Provide feedback via comments.  
- Star the repository to show your support.  


## ⚠️ Troubleshooting

### Common Issues

#### ONNX DLL Error  
If you encounter an error like this:  
```
DLL load failed while importing onnx_copy2py_export: a dynamic link Library (DLL) initialization routine failed.
```

**Solutions:**  
1. Install Microsoft Visual C++ Redistributable:  
   - Download both **x64** and **x86** versions from [Microsoft](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist).  
   - Restart your computer after installation.

2. Manually install ONNX Runtime:  
   ```bash
   pip uninstall onnxruntime onnxruntime-gpu  
   pip install onnxruntime
   ```

#### CPU-Only Systems  
If using a CPU-only machine:  

1. Install the CPU version of ONNX Runtime:  
   ```bash
   pip uninstall onnxruntime-gpu  
   pip install onnxruntime
   ```

2. Adjust chunk size to reduce memory usage:  
   - In `streamlit_app.py`, set `chunk_size` to a smaller value, e.g., 500–1000.  
   - Increase `chunk_overlap` for better context in the retrieval.

**Note:** Performance will be slower on CPU-only setups but should still function efficiently.

