class Rover {
  int x;
  int y;
  String direction;
  bool obstacleFound = false;

  Rover({this.x = 10, this.y = 10, this.direction = 'S'});

  void moveForward(List<List<String>> grid) {
    int newX = x;
    int newY = y;

    switch (direction) {
      case 'N':
        newY = (y + 1) % 200;
        break;
      case 'S':
        newY = (y - 1) % 200;
        break;
      case 'E':
        newX = (x - 1) % 200;
        break;
      case 'W':
        newX = (x + 1) % 200;
        break;
    }

    if (checkObstacle(newX, newY, grid)) {
      obstacleFound = true;
    } else {
      x = newX;
      y = newY;
      obstacleFound = false;
    }
  }

  bool checkObstacle(int newX, int newY, List<List<String>> grid) {
    return grid[newY][newX] == 'O'; 
  }

  void turnLeft() {
    switch (direction) {
      case 'N':
        direction = 'W';
        break;
      case 'S':
        direction = 'E';
        break;
      case 'E':
        direction = 'N';
        break;
      case 'W':
        direction = 'S';
        break;
    }
  }

  void turnRight() {
    switch (direction) {
      case 'N':
        direction = 'E';
        break;
      case 'S':
        direction = 'W';
        break;
      case 'E':
        direction = 'S';
        break;
      case 'W':
        direction = 'N';
        break;
    }
  }
}
