class GameTime
{
  int _elapsed;
  int _totalElapsed;

  int get elapsed => _elapsed;
  int get totalElapsed => _totalElapsed;

  void update(int totalElapsedTime) {
    _elapsed = totalElapsedTime - _totalElapsed;
    _totalElapsed = totalElapsedTime;
  }
}