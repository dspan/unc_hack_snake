class FoodElement extends ImgElement
{
  AffineTransform _trans;
  int lastTime = 0;
  final int x;
  final int y;

  AffineTransform get principleTransform => _trans;

  factory FoodElement.fromUrl(int x, int y, int width, int height, [String src = "res/food.png"])
  {
    final image = new ImageElement(src, null, null);

    return new FoodElement(x, y, width, height, image);
  }
  FoodElement(this.x, this.y, int width, int height, ImageElement img)
      : super(width, height, img, false)
  {
    _trans = this.addTransform();
  }

  // TODO: bring this out of the class into its own class
  void doAnim(int highResTime)
  {
    if (lastTime == 0)
    {
      lastTime = highResTime;
      return;
    }
    int delta = highResTime - lastTime;
    lastTime = highResTime;

    _trans.rotate(toRadians(-90 * (delta / 1000)), (this.width / 2) + this.x, (this.height / 2) + this.y);
  }
  num toRadians(num degrees)
  {
    return (degrees / 180) * math.PI;
  }
}