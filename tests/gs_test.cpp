#include "gs/gs.h"
#include <gtest/gtest.h>

namespace {

TEST(GSTest, CountElementsAboveThreshold) {
    double threshold = 0.5;
    double count = countElementsAboveThreshold(threshold);
    ASSERT_GE(count, 0.0);
    ASSERT_LE(count, 1.0);
}
}  //namespace
