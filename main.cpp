#include <iostream>

#include "version_info.h"


int main(const int argc, const char* argv[]) {

    std::cout << "Revision: " << REVISION << std::endl;
    std::cout << "Version: " << VERSION << std::endl;
    return 0;
}