#include <cstdlib>
#include "game_of_life.hpp"

constexpr const int CELL_SIDE = 10;
constexpr const int WINDOW_WIDTH = 1200;
constexpr const int WINDOW_HEIGHT = 800;
constexpr const int NUM_CELLS_X = WINDOW_WIDTH / CELL_SIDE;
constexpr const int NUM_CELLS_Y = WINDOW_HEIGHT / CELL_SIDE;
const sf::Vector2f CELL_VECTOR(CELL_SIDE, CELL_SIDE);

void drawing(WindowWrapped w)
{
    sf::RectangleShape cell, cell2;
    cell.setPosition(0, 0);
    cell.setSize(sf::Vector2f(CELL_SIDE, CELL_SIDE));
    cell.setFillColor(sf::Color::Blue);
    w.window->draw(cell);

    cell2.setPosition(CELL_SIDE, 0);
    cell2.setSize(sf::Vector2f(CELL_SIDE, CELL_SIDE));
    cell2.setFillColor(sf::Color::Red);
    w.window->draw(cell2);
}

int RunLife()
{
    uint8_t **cells = (uint8_t **)calloc(NUM_CELLS_X, sizeof(uint8_t *));
    uint8_t **cells_next = (uint8_t **)calloc(NUM_CELLS_X, sizeof(uint8_t *));
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        cells[i] = (uint8_t *)calloc(NUM_CELLS_Y, sizeof(uint8_t));
        cells_next[i] = (uint8_t *)calloc(NUM_CELLS_Y, sizeof(uint8_t));
    }


    // Creating the window
    WindowWrapped window(WINDOW_WIDTH, WINDOW_HEIGHT, "Game of life");

    while (isOpenWrapped(window))
    {
        // check all the window's events that were triggered since the last iteration of the loop
        checkEventsWrapped(window);

        // clear the window with black color
        clearWrapped(window, ColorWrapped{125, 125, 125});

        // draw everything here...
        // window.draw(...);
        drawing(window);

        // end the current frame
        displayWrapped(window);
    }
    delete window.window;
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        delete[] cells[i];
        delete[] cells_next[i];
    }
    delete[] cells;
    delete[] cells_next;

    return 0;
}