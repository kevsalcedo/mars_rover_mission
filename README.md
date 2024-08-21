# rover_app

In this application, I use the GetX libraries for state management and Formz for handling inputs and their errors, which ensures a robust and manageable user experience. All constants have been entered correctly to maintain consistency in design and functionality.

Important application rules are displayed at startup, and if these are not met, the user will not be able to submit the input. In particular, the rover will not be able to move forward if there is an obstacle in its path. In addition, the application warns the user if energy is being wasted by making more turns than necessary (more than 3 turns to the right or more than 3 turns to the left).

The “Shuffle” button allows the user to generate a new map and reposition the rover to the initial position with just one touch. In addition, the rover will only advance to the last position before detecting an obstacle and warning the user, ensuring that the map constraints are not exceeded.

The application is designed following clean architecture principles, allowing for a more organized and maintainable code.