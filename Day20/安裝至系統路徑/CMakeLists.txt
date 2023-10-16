cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

# set(OpenCV_DIR ${CMAKE_CURRENT_LIST_DIR}/../opencv-4.x/build)
# 設定 OpenCV_DIR 到 OpenCVConfig.cmake 所在資料夾
find_package(OpenCV REQUIRED)
# 尋找 OpenCV 這個第三方庫，REQUIRED 代表如果沒找到就會報錯

message(STATUS "OpenCV library status:")
message(STATUS "version: ${OpenCV_VERSION}")
message(STATUS "libraries: ${OpenCV_LIBS}")
message(STATUS "include path: ${OpenCV_INCLUDE_DIRS}")

include_directories(${OpenCV_INCLUDE_DIRS})
# 將 OpenCV 的 include 路徑加入到專案中
add_executable(main src/main.cpp)
# 將 main.cpp 編譯成可執行文件 main
target_link_libraries(main ${OpenCV_LIBS})
# 將 OpenCV 的 library 鍊結到 main 


configure_file(version.h.in version.h)
# 將version.h.in輸出成version.h
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")
# 將PROJECT_BINARY_DIR加入main的include路徑，使main可以include到 build/version.h
