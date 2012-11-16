part of snake_game;

class Food {
  SnakeGame _owner;
  int _value;
  int _cX;
  int _cY;
  final positionChangedEvent = new EventHandle<Food>();

  int get cX => _cX;
  set cX(int value) {
    _cX = value;
    this.positionChangedEvent.fireEvent(this);
  }
  int get cY => _cY;
  set cY(int value) {
    _cY = value;
    this.positionChangedEvent.fireEvent(this);
  }
  int get value => _value;
  SnakeGame get owner => _owner;

  Food(SnakeGame owner, int cX, int cY, [int foodValue = 10]) {
    _owner = owner;
    _cX = cX;
    _cY = cY;
    _value = foodValue;
  }
}