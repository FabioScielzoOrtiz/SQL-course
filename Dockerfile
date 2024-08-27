FROM python:3.9.1

# Install wget
RUN apt-get update && apt-get install -y wget

# Copy requirements.txt before installing dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt 

# Set the working directory
WORKDIR /app

# Copy the scripts folder including ingest_data.py
COPY scripts/ scripts/

# Set the entrypoint to the ingest_data.py script
ENTRYPOINT [ "python", "scripts/ingest_data.py" ]