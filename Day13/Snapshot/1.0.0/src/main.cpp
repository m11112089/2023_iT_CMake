// A simple program that computes the square root of a number
#include <iostream>
#include "mysqrt.h"

int main(int argc, char* argv[])
{
  if (argc < 2) return 1;
  
  // convert input to double
  const double inputValue = std::stod(argv[1]);
  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is " << outputValue
            << std::endl;
  return 0;
}
