#include "game_of_life.hpp"

int RunLife()
{
    // Creating the window
    WindowWrapped window(800, 600, "Game of life");

    while (isOpenWrapped(window))
    {
        // check all the window's events that were triggered since the last iteration of the loop
        checkEventsWrapped(window);

        // clear the window with black color
        clearWrapped(window, ColorWrapped{125, 125, 125});

        // draw everything here...
        // window.draw(...);

        // end the current frame
        displayWrapped(window);
    }

    delete window.window;
    return 0;
}