cmake_minimum_required(VERSION 3.22)
# 根據自己的cmake版本來設定最小版本，要小於當前版本
project(MathFunctions VERSION 1.0.0 LANGUAGES CXX)
# 設定專案名稱為MathFunctions，版本為1.0.0，且此項目使用C++

add_library(mysqrt SHARED src/mysqrt.cpp)
# 將mysqrt.cpp編譯成庫
target_include_directories(mysqrt PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
# 設定庫的頭文件路徑
set_target_properties(mysqrt PROPERTIES VERSION ${PROJECT_VERSION} SOVERSION ${PROJECT_VERSION_MAJOR})
# 設定庫的版本號，實做版本和專案版本相同，界面版本和主要版本相同

include(GNUInstallDirs)
# 引入 GNUInstallDirs 變數
install(FILES include/mysqrt.h DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR}) 
# 安裝庫到 /usr/local/include
install(TARGETS mysqrt DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_BINDIR}) 
# 安裝頭文件到 /usr/local/bin

# 顯示安裝路徑
message(STATUS "CMAKE_INSTALL_PREFIX: " ${CMAKE_INSTALL_PREFIX})
message(STATUS "CMAKE_INSTALL_INCLUDEDIR: " ${CMAKE_INSTALL_INCLUDEDIR})
message(STATUS "CMAKE_INSTALL_LIBDIR: " ${CMAKE_INSTALL_LIBDIR})