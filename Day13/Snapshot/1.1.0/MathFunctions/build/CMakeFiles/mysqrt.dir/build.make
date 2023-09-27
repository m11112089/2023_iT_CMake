# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/kai/2023_iT_CMake/Day13/MathFunctions

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/kai/2023_iT_CMake/Day13/MathFunctions/build

# Include any dependencies generated for this target.
include CMakeFiles/mysqrt.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mysqrt.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mysqrt.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mysqrt.dir/flags.make

CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o: CMakeFiles/mysqrt.dir/flags.make
CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o: ../src/mysqrt.cpp
CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o: CMakeFiles/mysqrt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/kai/2023_iT_CMake/Day13/MathFunctions/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o -MF CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o.d -o CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o -c /home/kai/2023_iT_CMake/Day13/MathFunctions/src/mysqrt.cpp

CMakeFiles/mysqrt.dir/src/mysqrt.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/mysqrt.dir/src/mysqrt.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/kai/2023_iT_CMake/Day13/MathFunctions/src/mysqrt.cpp > CMakeFiles/mysqrt.dir/src/mysqrt.cpp.i

CMakeFiles/mysqrt.dir/src/mysqrt.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/mysqrt.dir/src/mysqrt.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/kai/2023_iT_CMake/Day13/MathFunctions/src/mysqrt.cpp -o CMakeFiles/mysqrt.dir/src/mysqrt.cpp.s

# Object files for target mysqrt
mysqrt_OBJECTS = \
"CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o"

# External object files for target mysqrt
mysqrt_EXTERNAL_OBJECTS =

/home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0: CMakeFiles/mysqrt.dir/src/mysqrt.cpp.o
/home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0: CMakeFiles/mysqrt.dir/build.make
/home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0: CMakeFiles/mysqrt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/kai/2023_iT_CMake/Day13/MathFunctions/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX shared library /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mysqrt.dir/link.txt --verbose=$(VERBOSE)
	$(CMAKE_COMMAND) -E cmake_symlink_library /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0 /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1 /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so

/home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1: /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1

/home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so: /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so.1.1.0
	@$(CMAKE_COMMAND) -E touch_nocreate /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so

# Rule to build all files generated by this target.
CMakeFiles/mysqrt.dir/build: /home/kai/2023_iT_CMake/Day13/lib/libmysqrt.so
.PHONY : CMakeFiles/mysqrt.dir/build

CMakeFiles/mysqrt.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mysqrt.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mysqrt.dir/clean

CMakeFiles/mysqrt.dir/depend:
	cd /home/kai/2023_iT_CMake/Day13/MathFunctions/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/kai/2023_iT_CMake/Day13/MathFunctions /home/kai/2023_iT_CMake/Day13/MathFunctions /home/kai/2023_iT_CMake/Day13/MathFunctions/build /home/kai/2023_iT_CMake/Day13/MathFunctions/build /home/kai/2023_iT_CMake/Day13/MathFunctions/build/CMakeFiles/mysqrt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mysqrt.dir/depend

