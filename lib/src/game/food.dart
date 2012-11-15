class Food {
  SnakeGame _owner;
  int _value;
  int _cX;
  int _cY;

  int get cX => _cX;
  int get cY => _cY;
  int get value => _value;
  SnakeGame get owner => _owner;

  Food(SnakeGame owner, int cX, int cY, [int foodValue = 10]) {
    _owner = owner;
    _cX = cX;
    _cY = cY;
    _value = foodValue;
  }
}