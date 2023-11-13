#include "gs/gs.h"
#include <gtest/gtest.h>
#define TESTS

namespace {

TEST(GSTests, CountElementsAboveThreshold) {
    double threshold = 0.5;
    double count = countElementsAboveThreshold(threshold);
    ASSERT_GE(count, 0.0);
    ASSERT_LE(count, 1.0);
}

TEST(GSTests, GridInitializationTest) {

    const int width = 256;
    const int height = 256;

    init();

    for (int x = 0; x < width; ++x) {
        for (int y = 0; y < height; ++y) {
            EXPECT_EQ(u[x][y], 1.0);

            if (x >= 100 && x <= 200 && y >= 100 && y <= 150){
                EXPECT_GE(v[x][y], 0.0); 
                EXPECT_LE(v[x][y], 1.0); 
            }
            else {
                EXPECT_EQ(v[x][y], 0.0);
            }
        }
    }
}


}  //namespace
