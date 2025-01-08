# Use an official Python 3.10 base image
FROM python:3.10-slim

# Set a working directory
WORKDIR /app

# Install system dependencies needed for PDF processing and graphical rendering
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
    libglib2.0-0 && \
    rm -rf /var/lib/apt/lists/*

# Copy the requirements file and install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code and all files
COPY . .

# Ensure the container can communicate with the `ollama` instance on the host
ENV OLLAMA_HOST="host.docker.internal"
ENV RUNNING_IN_DOCKER="true"

# Expose the port used by Streamlit
EXPOSE 8501

# Command to run the Streamlit app
CMD [ "streamlit", "run", "streamlit_app.py", "--server.address=0.0.0.0" ]
