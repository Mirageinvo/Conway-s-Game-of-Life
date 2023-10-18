#define CELL_SIDE 20
#define WINDOW_WIDTH 1200
#define WINDOW_HEIGHT 800
#define NUM_CELLS_X WINDOW_WIDTH / CELL_SIDE
#define NUM_CELLS_Y WINDOW_HEIGHT / CELL_SIDE

void simFlush();
void simPutPixel(int x, int y, int argb);
int simRand();