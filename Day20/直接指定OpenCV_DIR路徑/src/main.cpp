#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "version.h"
using namespace std;
using namespace cv;

int main(int argc, char* argv[])
{
  if (argc < 2) {
    // report version
    std::cout << argv[0] << " Version " << cmake_totorial_VERSION_MAJOR << "."
              << cmake_totorial_VERSION_MINOR << "."
              << cmake_totorial_VERSION_PATCH << std::endl;
    return 1;
  }
	Mat im = imread(argv[1]);
	if (! im.data)
	{
		cout << "Can't read the file" << endl; 
		return 0;
	}

	namedWindow("tested", 1);
	imshow("tested", im);

	waitKey(0);
	return 0;
}