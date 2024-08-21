import 'package:flutter/material.dart';

import 'package:rover_app/config/constants/constants.dart';
import 'package:rover_app/models/models.dart';

class MapWidget extends StatelessWidget {
  final MarsMap marsMap;
  final Rover rover;

  const MapWidget({super.key, required this.marsMap, required this.rover});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: marsMap.size,
        childAspectRatio: 1.0,
      ),
      itemCount: marsMap.size * marsMap.size,
      itemBuilder: (context, index) {
        int x = index % marsMap.size;
        int y = index ~/ marsMap.size;

         Color color = _getColorForPosition(marsMap.grid[y][x]);

          bool isRoverPosition = x == rover.x && y == rover.y;

          return Container(
          decoration: BoxDecoration(
            color: isRoverPosition ? roverColor : color,
            border: Border.all(color: borderSpaceColor!),
          ),
          child: isRoverPosition
              ? _buildRoverIcon(rover.direction)
              : null,
        );
      },
    );
  }

  Color _getColorForPosition(String value) {
    switch (value) {
      case 'O':
        return obstacleColor!;
      default:
        return emptySpaceColor!;
    }
  }

  Widget _buildRoverIcon(String direction) {
    IconData icon;
    switch (direction) {
      case 'N':
        icon = Icons.arrow_downward;
        break;
      case 'S':
        icon = Icons.arrow_upward;
        break;
      case 'E':
        icon = Icons.arrow_back;
        break;
      case 'W':
        icon = Icons.arrow_forward;
        break;
      default:
        icon = Icons.help_outline; 
        break;
    }
    return Center(
      child: Container(
        color: roverColor, 
        padding: const EdgeInsets.all(0.0), 
        child: Icon(
          icon,
          color: roverIconColor, 
          size: 8,
        ),
      ),
    );
  }
  
}
