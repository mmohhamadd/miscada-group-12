# Gray-Scott Simulation C++ Implementation

 Gray-Scott reaction-diffusion model implementation and simulation

## Description

Reaction-diffusion models are notable for producing many patterns found in nature. In this short project, we solve the Gray-Scott reaction-diffusion equations with parameters given from user input.




The model is described in the following figure.

<p align="center"><img src="https://user-images.githubusercontent.com/17126595/50368112-549ae900-057d-11e9-85db-464ab4caaae8.png" width="250" alt="gray scott model"/></p>

And the parameters we ask the user to input is with the following format:

<p align="center"><img src="https://user-images.githubusercontent.com/17126595/50368114-55337f80-057d-11e9-880e-b23dedfa18fa.png" width="130" alt="params"/></p>

## How to build and run the project locally?
```
mkdir build && cd build
cmake ..
make all -j
./src/gs_main
```
## Tests

Simulation functionality is continuously being tested using Google Test software. In order to run tests locally, just run ```ctest``` in the root directory.

## CI/CD

Our CI/CD setup using Github action continuously updates the official docker image of the project on DockerHub on each modification on the main branch, 
every commit on each branch is also triggeres build job of GitHub action which checks the integrity of all tests have been passed

## Container
In order to run our software with docker containers (which we encourage you to do so), the only thing you should do is run the command below. 
```
docker run -p 5050:5050 -it --name grey-scott-simulation mmohhamadd/gray-scott-sim-cpp-with-tests
```
make sure you do it in a terminal, because you will be prompted to input your arbitary value to the problem parameters and after quite a while the c++ simulation ends and again the process of creating 
an animation from the outputs from the previous stage will be started. after the python script creates an animation, an http server will host the result and you will see a link like 

https://localhost:5050/animation.gif 

which will redirect you to the output of the simulation shown in format of a gif

![](https://github.com/mmohhamadd/miscada-group-12/blob/main/data/animations/animation-sample.gif)

