cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial CXX)
# 設定專案名稱，且此項目使用C++

# 普通版本
include_directories(${PROJECT_SOURCE_DIR}/include)
add_executable(main src/main.cpp src/mysqrt.cpp)

set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)
# 設定庫的輸出路徑

# 靜態庫
add_library(mysqrt_a STATIC src/mysqrt.cpp)
target_include_directories(mysqrt_a PUBLIC ${PROJECT_SOURCE_DIR}/include)
add_executable(main_a src/main.cpp)
target_link_libraries(main_a mysqrt_a)
# 動態庫
add_library(mysqrt_so SHARED src/mysqrt.cpp)
target_include_directories(mysqrt_so PUBLIC ${PROJECT_SOURCE_DIR}/include)
add_executable(main_so src/main.cpp)
target_link_libraries(main_so mysqrt_so)

