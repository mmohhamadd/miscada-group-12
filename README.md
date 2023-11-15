# gray-scott-sim

## How to Build?

Install CMake and in the project file run

```
mkdir build
cd build
cmake ..
make
```

We configure the system build in the CMakeLists.txt.

There are the things we did in it:
1. Sets the minimum version requirement for CMake, which is 3.14. 
2. Project name defined.
3. Sets the compilation standard for C++ 14. 
4. Test functionality enabled. 
5. The FetchContent module is used to declare external dependencies (in this case Google Test). 
6. Check and possibly download Google Test. 
7. The source files are added, creating an executable called GrayScottSim. 
8. Test files are added, creating a test executable named GrayScottTests. 
9. Linked the Google Test library to the test executable. 
10. Contains macros provided by Google Test to discover and register tests.

https://cmake.org/

## Tests

use Google Test

### test1: Check that the type of the model parameters (F , k) matches that of the element typeof the u and v vectors.

### test2: Check that the variables u and v are the same size.

### test3: Check that the simulation produces the mathematically correct answer when u = 0 and v = 0.

![](https://github.com/mmohhamadd/miscada-group-12/blob/main/data/animations/animation-sample.gif)