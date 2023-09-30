#include "mysqrt.h"
#include <iostream>
double sqrt(double x, int iteration)
{
  if (x <= 0) return 0;
  double result = x;

  for (int i = 0; i < iteration; ++i) {
    if (result <= 0) {
      result = 0.1;
    }
    double delta = x - (result * result);
    result = result + 0.5 * delta / result;
    std::cout << i << "Computing sqrt of " << x << " to be " << result << std::endl;
  }
  return result;
}


