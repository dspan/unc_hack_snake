part of snake_game;

class SnakeSegment {
  Vector _cellPos;
  final _positionChangedEvent = new EventHandle<SnakeSegment>();

  Vector get cellPos => _cellPos;
  set cellPos(Vector value) {
    _cellPos = value;
    _positionChangedEvent.fireEvent(this);
  }
  EventRoot<SnakeSegment> get positionChangedEvent => _positionChangedEvent;

  SnakeSegment(this.cellPos) {

  }
}