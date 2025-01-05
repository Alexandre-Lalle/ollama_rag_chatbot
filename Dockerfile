# Use an official Python 3.10 base image
FROM python:3.10-slim

# Set a working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Ensure that the container can communicate with the `ollama` instance on the host
ENV OLLAMA_HOST="host.docker.internal"
ENV RUNNING_IN_DOCKER="true"

# Expose the port used by Streamlit
EXPOSE 8501

# Command to run the Streamlit app
CMD [ "streamlit", "run", "streamlit_app.py", "--server.address=0.0.0.0" ]
