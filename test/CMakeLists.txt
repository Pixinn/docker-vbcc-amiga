cmake_minimum_required(VERSION 3.4)

project("TEST" C ASM)

set(C_FILES hello.c)
set(ASM_FILES test.asm)

add_executable(${PROJECT_NAME} ${C_FILES} ${ASM_FILES})
target_link_libraries(${PROJECT_NAME} amiga)
