#include "gs/gs.h"
#include <gtest/gtest.h>

// Test 0.1: Check that the type of the model parameters (F, k) matches that of the element type of the u and v vectors.
TEST(GSTests, CheckParameterTypes) {
    // Check if types of F and k match the type of elements in u and v
    ASSERT_TRUE((std::is_same<decltype(F), double>::value));
    ASSERT_TRUE((std::is_same<decltype(k), double>::value));
    using UElementType = decltype(u[0][0]);
    using VElementType = decltype(v[0][0]);
    ASSERT_TRUE(typeid(F).name() == typeid(UElementType).name() && typeid(k).name() == typeid(VElementType).name());
    // std::cout << "Test1 Passed!" << std::endl;
}

// Test 0.2: Check that the variables u and v are the same size.
TEST(GSTests, CheckSameSize) {
    // Check if u and v have the same dimensions
    EXPECT_EQ(u.size(), v.size());
    for (size_t i = 0; i < u.size(); ++i) {
        EXPECT_EQ(u[i].size(), v[i].size());
    }
}

// Test 0.3: Check that the simulation produces the mathematically correct answer when u = 0 and v = 0.
TEST(GSTests, writeVTKFile) {
    for (auto &row : u)
        std::fill(row.begin(), row.end(), 0.0);
    for (auto &row : v)
        std::fill(row.begin(), row.end(), 0.0);

    simulateStep();
    for (size_t x = 1; x < width - 1; ++x) {
        for (size_t y = 1; y < height - 1; ++y) {
            // When both u and v are 0, the result should stay 0 (assuming no external feed or kill rates)
            EXPECT_DOUBLE_EQ(0.0018, u[x][y]);
            EXPECT_DOUBLE_EQ(0.0, v[x][y]);
        }
    }
    std::cout << "Simulation check successful: u increases to 0.0018 and v remains at 0." << std::endl;
}

int main(int argc, char **argv) {
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}