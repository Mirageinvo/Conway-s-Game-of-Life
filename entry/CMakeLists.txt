set(SOURCES
    entry.cpp
    ${PROJECT_ROOT}/game_of_life/game_of_life.cpp
)

add_executable(graphics ${SOURCES})
target_link_libraries(graphics PUBLIC wrapped)
target_include_directories(graphics PUBLIC ${PROJECT_ROOT}/game_of_life)

add_custom_target(
    run_graphics
    COMMENT "Running graphics"
    COMMAND ./graphics
)
add_dependencies(run_graphics graphics)