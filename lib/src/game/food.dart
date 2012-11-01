class Food
{

  int _value;
  int _cX;
  int _cY;

  int get cX => _cX;
  int get cY => _cY;
  int get value => _value;

  Food(int cX, int cY, [int foodValue = 10])
  {
    _cX = cX;
    _cY = cY;
    _value = foodValue;
  }
}