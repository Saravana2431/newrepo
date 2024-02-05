FROM python

# Set the working directory inside the container
WORKDIR /usr/app

# Copy the requirements.txt file to the container's working directory (ignore if the file doesn't exist)
COPY requirements.txt . || true

# Check if requirements.txt exists; if yes, install dependencies; if no, print a message and skip installation
RUN test -f requirements.txt && pip install --no-cache-dir -r requirements.txt || echo "No requirements file found, skipping installation."

# Copy all files from the host to the container's working directory
COPY . .

# Expose port 8000 to the outside world (this is a documentation purpose; doesn't actually publish the port)
EXPOSE 8000

# Set the default command to run when the container starts
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

