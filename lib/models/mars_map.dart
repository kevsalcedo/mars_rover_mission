import 'package:rover_app/models/rover.dart';

class MarsMap {
  final int size;
  List<List<String>> grid;
  Rover rover;

  MarsMap({required this.size})
      : grid = List.generate(size, (_) => List.filled(size, 'E')),
        rover = Rover();

  MarsMap copyWith({
    List<List<String>>? grid,
    Rover? rover,
  }) {
    return MarsMap(size: size)
      ..grid = grid ?? this.grid
      ..rover = rover ?? this.rover;
  }
}
