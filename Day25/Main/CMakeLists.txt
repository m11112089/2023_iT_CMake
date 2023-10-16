cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(cmake_totorial VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為cmake_totorial，版本為1.0.0，且此項目使用C++

find_package(glog REQUIRED)
# 尋找 glogConfig.cmake，REQUIRED 將其設定為必要項目，若找不到則會報錯

message(STATUS "glog_FOUND: ${glog_FOUND}")
message(STATUS "glog_INCLUDE_DIRS: ${glog_INCLUDE_DIRS}")
message(STATUS "glog_LIBRARY_DIRS: ${glog_LIBRARY_DIRS}")
message(STATUS "glog_LIBRARIES: ${glog_LIBRARIES}")
message(STATUS "glog_VERSION: ${glog_VERSION}")
# 顯示glog提供的資訊

add_executable(main src/main.cpp)
# 將main.cpp編譯成可執行文件main
target_link_libraries(main PUBLIC glog::glog)
# 將在glog這個命名空間中的庫鍊結到執行檔main
                                 