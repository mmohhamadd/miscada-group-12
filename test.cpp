#include "gs.h"
#include <gtest/gtest.h>

// initialize the test file
class GSTest : public ::testing::Test {
protected:
    void SetUp() override {
        init();
    }
};

// Test countElementsAboveThreshold function
TEST_F(GSTest, CountElementsAboveThreshold) {
    double threshold = 0.5;
    double count = countElementsAboveThreshold(threshold);
    ASSERT_GE(count, 0.0);
    ASSERT_LE(count, 1.0);
}

// Run all tests
int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}