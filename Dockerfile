FROM ubuntu:latest
# Copy the build artifacts uploaded in previous job into the Docker image
COPY ./build ./app
RUN chmod +x /app/src/gs_main
# Run the output executable
CMD ["./app/src/gs_main"]