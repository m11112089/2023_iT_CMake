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
install(TARGETS mysqrt DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}) 
# 安裝頭文件到 /usr/local/bin

set(PACKAGE_INCLUDE_DIRS ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_INCLUDEDIR})
# 設定要替換Config.cmake.in文件中的@PACKAGE_INCLUDE_DIRS@變數
set(PACKAGE_LIBRARY_DIRS ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR})
# 設定要替換Config.cmake.in文件中的@PACKAGE_LIBRARY_DIRS@變數
set(PACKAGE_LIBS mysqrt)
# 設定要替換Config.cmake.in文件中的@PACKAGE_LIBS@變數

include(CMakePackageConfigHelpers)
configure_package_config_file(
	${PROJECT_SOURCE_DIR}/Config.cmake.in
	${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
	PATH_VARS PACKAGE_INCLUDE_DIRS PACKAGE_LIBRARY_DIRS PACKAGE_LIBS
)
install(FILES ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake DESTINATION lib/cmake/${PROJECT_NAME})
# 讀入 ${PROJECT_SOURCE_DIR}/Config.cmake.in 文件
# 生成 ${PROJECT_BINARY_DIR}/${PROJECT_NAME}Config.cmake 文件
# 將生成出的 Config.cmake 安裝到 /usr/local/lib/cmake/${PROJECT_NAME}，讓find_package能夠在預設的搜索路徑找到
# 替換 ${PROJECT_SOURCE_DIR}/Config.cmake.in 文件中的 @PACKAGE_INCLUDE_DIRS@ @PACKAGE_LIBRARY_DIRS@ @PACKAGE_LIBS@ 變數