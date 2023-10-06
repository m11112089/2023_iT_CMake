#include <iostream>
#include "version.h"
#include <fstream>
#include <nlohmann/json.hpp>
using json = nlohmann::json;

int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		// report version
		std::cout << argv[0] << " Version " << cmake_tutorial_VERSION_MAJOR << "."
				  << cmake_tutorial_VERSION_MINOR << "."
				  << cmake_tutorial_VERSION_PATCH << std::endl;
		return 1;
	}

	std::ifstream f(argv[1]);
	json data = json::parse(f);

	std::cout << data << std::endl;
	return 0;
}