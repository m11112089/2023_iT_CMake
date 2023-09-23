add_library(mysqrt OBJECT src/mysqrt.cpp)
# 將mysqrt.cpp編譯成名為mysqrt的object檔案
target_include_directories(mysqrt PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
# 將 ${CMAKE_CURRENT_SOURCE_DIR}/include 目錄加入 mysqrt 的 include 目錄，並且使用PUBLIC的方式向上傳遞給main，
# 否則main無法使用mysqrt的include目錄，造成編譯錯誤
message(STATUS "MathFunctions CMake_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "MathFunctions CMake_CURRENT_BINARY_DIR: ${CMAKE_CURRENT_BINARY_DIR}")
# 查看CMake_CURRENT_SOURCE_DIR和CMake_CURRENT_BINARY_DIR的值
