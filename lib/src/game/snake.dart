part of snake_game;

class Snake extends Updateable {
  final segments = new List<SnakeSegment>();
  Vector direction;
  GridManager grid;
  final _deathEvent = new EventHandle<Snake>();

  int movementTimer = 0;
  final movementStepTime = 500;

  Snake(this.grid) {

  }

  EventRoot<Snake> get deathEvent => _deathEvent;
  SnakeSegment get head => (this.segments.length > 0 ? this.segments[0] : null);
               set head(SnakeSegment value) => this.segments[0] = value;
  SnakeSegment get tail => (this.segments.length > 0 ? this.segments[this.segments.length - 1] : null);
               set tail(SnakeSegment value) => this.segments[this.segments.length - 1] = value;

  void initialize() {

    super.initialize();
  }

  void update(GameTime gameTime) {
    super.update(gameTime);

    this.movementTimer += gameTime.elapsed;
    while (this.movementTimer > movementStepTime) {
      this.movementTimer -= movementStepTime;

      if (this.canMove()) {
        this.move();
      }
      else {
        // player just died
        this.die();
      }
    }
  }

  void die() {
    this.enabled = false;

    _deathEvent.fireEvent(this);
  }

  void spawn(Vector cellStart) {
    this.segments.clear();
    this.direction = Directions.right;

    // create 3 starting segments
    for (int i = 0; i < 3; i++)
    {
      var segment = new SnakeSegment(cellStart - (this.direction * i));
      this.segments.add(segment);
    }
    this.enabled = true;
    this.movementTimer = 0;
  }

  bool isSnakeCell(int cellX, int cellY) => this.segments.filter((s) => s.cellPos.x == cellX && s.cellPos.y == cellY).length > 0;
  bool isSnakePos(Vector pos) => isSnakeCell(pos.x, pos.y);

  bool canMove() {
    var nextPos = this.head.cellPos + this.direction;

    return this.grid.isValidPos(nextPos) && !this.isSnakePos(nextPos);
  }

  void move() {
    // store data of whether or not we should grow
    var shouldGrow = grid.isFoodAtPos(this.head.cellPos + this.direction);
    var tail = this.segments[this.segments.length - 1];

    // move the segments
    for (int i = 1; i < this.segments.length; i++)
    {
       // move all of the segments back one
       this.segments[i] = this.segments[i - 1];
    }
    // create a new head
    this.head = new SnakeSegment(this.head.cellPos + this.direction);

    if (shouldGrow) {
      // re-add the last tail if we moved onto a food piece
      this.segments.add(tail);
    }
  }
}