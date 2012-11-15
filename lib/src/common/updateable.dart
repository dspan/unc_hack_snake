part of snake_common;

abstract class Updateable extends DisposableImpl {
  bool enabled = true;
  int updateOrder;

  void initialize()
  {

  }

  void update(GameTime gameTime)
  {
    if (!this.enabled)
    {
      return;
    }
  }

  void disposeInternal()
  {
    this.enabled = false;
    this.updateOrder = 0;
  }
}