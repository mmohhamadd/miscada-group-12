# Gray-Scott Simulation C++ Implementation
## Description

This repository contains a C++ implementation of the Gray-Scott reaction-diffusion model, including simulation and testing. The Gray-Scott model is a mathematical formulation that describes how the concentration of substances distributed in space changes under the influence of local chemical reactions and diffusion. This project allows users to input specific parameters to observe a variety of patterns produced by the model.



The model is described in the following figure.
<p align="center"><img src="https://user-images.githubusercontent.com/17126595/50368112-549ae900-057d-11e9-85db-464ab4caaae8.png" width="250" alt="gray scott model"/></p>


The parameters required from the user are formatted as follows:
<p align="center"><img src="https://user-images.githubusercontent.com/17126595/50368114-55337f80-057d-11e9-880e-b23dedfa18fa.png" width="130" alt="params"/></p>

## Building and Running the Project Locally
To build and run the project locally, use the following commands:
```
mkdir build && cd build
cmake ..
make all -j
./src/gs_main
```
## Testing

The functionality of the simulation is continuously tested using Google Test. To run the tests locally, execute ```ctest``` command.

## Continuous Integration/Continuous Deployment (CI/CD)

Our CI/CD pipeline uses GitHub Actions and consists of two parts. First, every commit on all branches triggers a 'build' job that checks the integrity of the code and verifies that all tests pass. If a commit is made to the main branch, GitHub Actions will automatically update the official Docker image of the project on DockerHub in 'docker' job.

Here is an example of a successful GitHub Actions run:
![image](https://github.com/mmohhamadd/miscada-group-12/assets/48697484/4e788526-b8bf-4bb4-9d28-676e69363e7a)


## Running the Project Using Docker
We recommend running our software using Docker as it integrates a Python script that generates a visually appealing simulation output. Follow the steps below:

1- Open a terminal and run the following command:
```
docker run -p 5050:5050 -it mmohhamadd/gray-scott-sim-cpp-with-tests
```
2- you will be prompted to input your arbitrary values for the problem parameters. If you don't provide any, the system will generate random ones for you.
![image](https://github.com/mmohhamadd/miscada-group-12/assets/48697484/98c6860e-a423-441c-a8db-1426d63ba38e)

3- The C++ simulation will then start. This process may take a while.

4- Once the C++ simulation ends, the Python script will start creating an animation from the simulation outputs.

5- After the animation is created, an HTTP server will host the result. You can view the animation by visiting the following link in your web browser:
[http://localhost:5050/animation.gif](URL)

Enjoy the simulation!
![animation (1)](https://github.com/mmohhamadd/miscada-group-12/assets/48697484/6419b029-7659-4174-8cc3-ed43f5a6ea2f)

