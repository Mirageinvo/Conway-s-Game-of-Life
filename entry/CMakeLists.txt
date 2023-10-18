set(SOURCES
    entry.c
    ${PROJECT_ROOT}/game_of_life/game_of_life.c
)

add_executable(graphics ${SOURCES})
target_link_libraries(graphics PUBLIC SDL2)
target_include_directories(graphics PUBLIC ${PROJECT_ROOT}/entry)

add_custom_target(
    run_graphics
    COMMENT "Running graphics"
    COMMAND ./graphics
)
add_dependencies(run_graphics graphics)