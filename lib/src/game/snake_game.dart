part of snake_game;

class SnakeGame extends UpdateableContainer {
  final _gameTime = new GameTime();
  final foodPieces = new List<Food>();
  Snake snake;
  final grid = new GridManager(10, 10);

  SnakeGame() {
    this.snake = new Snake(this.grid);
  }

  void run() {
    window.requestAnimationFrame((int firstTime) {
      _gameTime.update(firstTime);
      _requestFrame();
    });
  }

  void _requestFrame() {
    window.requestAnimationFrame(_tick);
  }

  void _tick(int highResTime) {
    _gameTime.update(highResTime);
    update(_gameTime);
    _requestFrame();
  }

  void initialize() {
    this.addComponent(this.snake);

    super.initialize();
  }

  void update(GameTime gameTime) {

    super.update(gameTime);
  }
}