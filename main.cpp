#include <iostream>

#include "version_info.h"

#define VERSION "1.0"

int main(const int argc, const char* argv[]) {

    std::cout << "Revision: " << REVISION << std::endl;
    std::cout << "Version: " << VERSION << std::endl;
    return 0;
}