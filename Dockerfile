FROM ubuntu:latest

Workdir /app

# Install Python and simulation dependencies
RUN apt-get update && apt-get install -y python3 python3-pip libgl1-mesa-glx libxrender1 xvfb
Copy ./requirements.txt .
RUN pip3 install -r requirements.txt

# init data folder
COPY data ./data
# Copy the build artifacts uploaded in previous job into the Docker image
COPY ./build ./build

# Copy the simulation script and run script into the Docker image
COPY ./simulation/simulation.py ./run.sh ./
RUN ["chmod", "+x", "/app/run.sh"]
# Expose the port 5050 for serving animation
EXPOSE 5050

# Run the output executable
ENTRYPOINT ["/app/run.sh"]
