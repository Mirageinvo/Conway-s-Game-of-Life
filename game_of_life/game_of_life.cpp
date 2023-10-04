#include <cstdlib>
#include "game_of_life.hpp"

constexpr int help_arr_x[] = {-1, -1, 0, 1, 1, 1, 0, -1};
constexpr int help_arr_y[] = {0, 1, 1, 1, 0, -1, -1, -1};

int GoodInds(int x, int y)
{
    return x >= 0 && y >= 0 && x < NUM_CELLS_X && y < NUM_CELLS_Y;
}

int NeighborNum(int ind_x, int ind_y, int **cells)
{
    int new_ind_x, new_ind_y;
    int result = 0;
    for (int i = 0; i < 8; ++i) {
        int new_ind_x = ind_x + help_arr_x[i];
        int new_ind_y = ind_y + help_arr_y[i];
        if (GoodInds(new_ind_x, new_ind_y) && cells[new_ind_x][new_ind_y] == 1) {
            result++;
        }
    }
    return result;
}

void prepNextIter(int*** cells, int*** cells_next)
{
    int neigbors;
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        for (int j = 0; j < NUM_CELLS_Y; ++j) {
            neigbors = NeighborNum(i, j, *cells);
            if (neigbors < 2 || neigbors > 3) {
                (*cells_next)[i][j] = 0;
            }
            else {
                (*cells_next)[i][j] = 1;
            }
        }
    }
    std::swap(*cells, *cells_next);
}

int RunLife()
{
    int **cells = (int **)calloc(NUM_CELLS_X, sizeof(int *));
    int **cells_next = (int **)calloc(NUM_CELLS_X, sizeof(int *));
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        cells[i] = (int *)calloc(NUM_CELLS_Y, sizeof(int));
        cells_next[i] = (int *)calloc(NUM_CELLS_Y, sizeof(int));
        for (int j = 0; j < NUM_CELLS_Y; ++j) {
            int random = randWrapped() % 10;
            if (random < 1) {
                cells[i][j] = 1;
            }
            else {
                cells[i][j] = 0;
            }
        }
    }

    // Creating the window
    WindowWrapped window(WINDOW_WIDTH, WINDOW_HEIGHT, "Game of life");

    while (isOpenWrapped(window))
    {
        // Checking all the window's events that were triggered since the last iteration of the loop
        checkEventsWrapped(window);

        // Clearing the window with black color
        clearWrapped(window, ColorWrapped{0, 0, 0});

        // Drawing everything
        drawingWrapped(window, cells);

        // Preparing an array for the next frame
        prepNextIter(&cells, &cells_next);

        // Ending the current frame
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