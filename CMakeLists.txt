#
#  Makefile for JOY
#
cmake_minimum_required(VERSION 3.0)
project(Joy VERSION 1.0)
set(CMAKE_BUILD_TYPE Debug)
add_definitions(-DGC_NOT_DLL -D_CRT_SECURE_NO_WARNINGS -DGC_BDW -DBIT_32)
if(WIN32)
else()
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -g -O0 --coverage")            # debug, no optimisation
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} --coverage") # enabling coverage
endif()
include_directories(bdwgc/include)
add_subdirectory(bdwgc)
add_executable(joy interp.c scan.c utils.c main.c)
target_link_libraries(joy gc-lib)
add_custom_target(demo1.txt ALL
                  COMMAND joy gcd 24 54 >demo1.txt)
add_custom_target(demo2.txt ALL
                  COMMAND joy joytut.inp >demo2.txt)                  
add_custom_target(demo3.txt ALL
                  COMMAND joy lsptst.joy >demo3.txt)  	
add_custom_target(demo4.txt ALL
                  COMMAND joy jp-joytst.joy >demo4.txt)  
add_custom_target(demo5.txt ALL
                  COMMAND joy laztst.joy >demo5.txt) 
add_custom_target(demo6.txt ALL
                  COMMAND joy grmtst.joy >demo6.txt)  
add_custom_target(demo7.txt ALL
                  COMMAND joy modtst.joy >demo7.txt)
add_custom_target(demo8.txt ALL
                  COMMAND joy mtrtst.joy >demo8.txt)                    
add_custom_target(demo9.txt ALL
                  COMMAND joy plgtst.joy >demo9.txt)  
add_custom_target(demo10.txt ALL
                  COMMAND joy symtst.joy >demo10.txt)
add_custom_target(demo11.txt ALL
                  COMMAND joy test.joy >demo11.txt)
add_custom_target(demo12.txt ALL
                  COMMAND joy reptst.joy >demo12.txt)
add_custom_target(demo13.txt ALL
                  COMMAND joy jp-nestrec.joy >demo13.txt)
add_custom_target(demo14.txt ALL
                  COMMAND joy jp-reprodtst.joy >demo14.txt)
add_custom_target(demo15.txt ALL
                  COMMAND joy flatjoy.joy >demo15.txt)
add_custom_target(demo16.txt ALL
                  COMMAND joy jp-church.joy >demo16.txt)                  
