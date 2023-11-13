FROM ubuntu:latest
# Copy the build artifacts uploaded in previous job into the Docker image
COPY ./build ./app
# Run the output executable
CMD ["./app/src/gs_main"]