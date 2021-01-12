#include <iostream>

#include "base/Logging.h"

int main()
{
    std::cout << "====================================.\n"<< std::endl;
    
    std::cout << "main test"<< std::endl;
    
    
    LOG_ERROR("LOG_ERROR test1 .\n");

    LOG_WARNING("LOG_WARNING test2 .\n");

    LOG_DEBUG("LOG_DEBUG test3 .\n");



    std::cout << "hello"<< std::endl;

    return 0;
}