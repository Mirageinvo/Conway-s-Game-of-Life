#include "entry.h"

int GoodInds(int x, int y)
{
    return x >= 0 && y >= 0 && x < NUM_CELLS_X && y < NUM_CELLS_Y;
}

int NeighborNum(int ind_x, int ind_y, int (*cells)[NUM_CELLS_X][NUM_CELLS_Y])
{
    int help_arr_x[] = {-1, -1, 0, 1, 1, 1, 0, -1};
    int help_arr_y[] = {0, 1, 1, 1, 0, -1, -1, -1};
    int new_ind_x, new_ind_y;
    int result = 0;
    for (int i = 0; i < 8; ++i) {
        int new_ind_x = ind_x + help_arr_x[i];
        int new_ind_y = ind_y + help_arr_y[i];
        if (GoodInds(new_ind_x, new_ind_y) && (*cells)[new_ind_x][new_ind_y] == 1) {
            result++;
        }
    }
    return result;
}

void prepNextIter(int (*cells)[NUM_CELLS_X][NUM_CELLS_Y], int (*cells_next)[NUM_CELLS_X][NUM_CELLS_Y])
{
    int neigbors;
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        for (int j = 0; j < NUM_CELLS_Y; ++j) {
            neigbors = NeighborNum(i, j, cells);
            if (neigbors < 2 || neigbors > 3) {
                (*cells_next)[i][j] = 0;
            }
            else {
                (*cells_next)[i][j] = 1;
            }
        }
    }
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        for (int j = 0; j < NUM_CELLS_Y; ++j) {
            (*cells)[i][j] = (*cells_next)[i][j];
        }
    }
}

void app() {
    int cells[NUM_CELLS_X][NUM_CELLS_Y];
    int cells_next[NUM_CELLS_X][NUM_CELLS_Y];
    for (int i = 0; i < NUM_CELLS_X; ++i) {
        for (int j = 0; j < NUM_CELLS_Y; ++j) {
            int random = simRand() % 10;
            if (random < 1) {
                cells[i][j] = 1;
            }
            else {
                cells[i][j] = 0;
            }
        }
    }

    for (int step = 0; step < 1000; ++step) {
        for (int y = 0; y < NUM_CELLS_Y; ++y) {
            for (int x = 0; x < NUM_CELLS_X; ++x) {
                if (cells[x][y] == 1) {
                    for (int i = 0; i < CELL_SIDE; ++i) {
                        for (int j = 0; j < CELL_SIDE; ++j) {
                            simPutPixel(x * CELL_SIDE + i, y * CELL_SIDE + j, 16842496);
                        }
                    }
                }
                else {
                    for (int i = 0; i < CELL_SIDE; ++i) {
                        for (int j = 0; j < CELL_SIDE; ++j) {
                            simPutPixel(x * CELL_SIDE + i, y * CELL_SIDE + j, 0);
                        }
                    }
                }
            }
        }
        prepNextIter(&cells, &cells_next);
        simFlush();
    }
}