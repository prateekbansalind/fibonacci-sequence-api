# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory within the container to /app
WORKDIR /app

# Copy application source code to the container directory /app
COPY src/ /app

# Install Flask, required for the web application to run
RUN pip install --no-cache-dir flask

# Expose port 5000 for the application
EXPOSE 5000

# Define the command to run the application using Python
CMD ["python", "app.py", "--host=0.0.0.0"]
