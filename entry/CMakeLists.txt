set(SOURCES
    entry.c
    ${PROJECT_ROOT}/game_of_life/game_of_life.c
)
set(LOGGER_FILE ${PROJECT_ROOT}/llvm-instrumental-pass/log.c)

add_executable(graphics ${SOURCES})
target_link_libraries(graphics PUBLIC SDL2)
target_include_directories(graphics PUBLIC ${PROJECT_ROOT}/entry)

add_custom_target(
    run_graphics
    COMMENT "Running graphics"
    COMMAND ./graphics
)
add_dependencies(run_graphics graphics)

set(OUT_MAIN_ ${CMAKE_CURRENT_BINARY_DIR}/game_of_life.o)
add_custom_target(profiled_main_
        COMMENT "Instrumenting ${SOURCE}"
        OUTPUT ${OUT_MAIN_}
        COMMAND clang-14 -Xclang -load -Xclang ${PROJECT_BINARY_ROOT}/llvm-instrumental-pass/liblogger.so ${CMAKE_SOURCE_DIR}/game_of_life/game_of_life.c ${CMAKE_SOURCE_DIR}/llvm-instrumental-pass/log.c -c -O2 -flegacy-pass-manager
)
add_dependencies(profiled_main_ logger)

set_property(SOURCE ${OUT_MAIN_} PROPERTY GENERATED 1)
add_executable(managed_game_of_life ${OUT_MAIN_} ${CMAKE_SOURCE_DIR}/entry/entry.c)
target_include_directories(managed_game_of_life PUBLIC ${PROJECT_ROOT}/entry ${PROJECT_ROOT}/llvm-instrumental-pass)
target_link_libraries(managed_game_of_life PUBLIC SDL2)
add_dependencies(managed_game_of_life profiled_main_)

add_custom_target(
		run-get-log
		COMMAND timeout 10 ${PROJECT_BINARY_ROOT}/entry/managed_game_of_life > ${PROJECT_BINARY_ROOT}/log.txt
		DEPENDS managed_game_of_life
)

add_custom_target(
		run-get-statistics
		COMMAND ${Python3_EXECUTABLE} ${PROJECT_ROOT}/llvm-instrumental-pass/get_statistics.py ${PROJECT_BINARY_ROOT}/log.txt ${PROJECT_ROOT}/screenshots
)