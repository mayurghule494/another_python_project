# Use a Python 3 base image
FROM python:3

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container
COPY app/ /app/

# Install application dependencies
RUN pip install -r /app/requirements.txt

# Install Nginx
RUN apt-get update && apt-get install -y nginx

# Remove the default Nginx configuration
RUN rm /etc/nginx/sites-enabled/default

# Copy your Nginx configuration file
COPY nginx/nginx.conf /etc/nginx/sites-available/

# Create a symbolic link to enable your Nginx configuration
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# Expose port 80 for Nginx
EXPOSE 80

CMD ["python", "app.py"]
