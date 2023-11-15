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
RUN chmod +x ./run.sh
RUN chmod +x ./build/src/gs_main

# If run.sh was saved on windows this command will replace those CR characters with nothing, 
# which will leave these lines with LF (\n) as the ending, and Bash will be able to read and execute the file by running, essentially DOS to UNIX conversion
RUN sed -i -e 's/\r$//' run.sh


# Expose the port 5050 for serving animation
EXPOSE 5050

# Run the output executable
CMD ["./run.sh"]