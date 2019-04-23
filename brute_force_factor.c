#include <omp.h>
#include <boost/multiprecision/cpp_int.hpp>
#include <iostream>

using namespace boost::multiprecision;

inline cpp_int pow(cpp_int value, cpp_int exponent) {
    if(exponent <= 0)
        return 1;
    else if(exponent == 1)
        return value;
    else {
        if(exponent % 2 == 0) {
            return pow(value * value, exponent / 2);
        } else {
            return value * pow(value, exponent - 1);
        }
    }
}



int main(int argc, char *argv[])
{
  cpp_int generator = 53;
  cpp_int goal      = 1000000000061;
  cpp_int modulus   = 1000000000063;
  int64_t modulus64 = 1000000000063;


#pragma omp parallel for
  for (int64_t i = 0; i < modulus64; ++i) {
    cpp_int result = pow(generator, cpp_int(i)) % modulus;
    if(int64_t(result) == goal) {
      std::cout << "Solution: " << i << std::endl;
    }
  }

  return 0;
}
