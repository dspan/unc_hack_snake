class FoodElement extends ImgElement
{
  AffineTransform _trans;
  int lastTime = 0;

  AffineTransform get principleTransform => _trans;

  factory FoodElement.fromUrl(int width, int height, [String src = "res/food.png"])
  {
    final image = new ImageElement(src, null, null);

    return new FoodElement(width, height, image);
  }
  FoodElement(int width, int height, ImageElement img)
      : super(width, height, img, false)
  {
  }

  // TODO: bring this out of the class into its own class
  void doAnim(int highResTime)
  {
    if (_trans == null)
    {
      _trans = this.addTransform();
    }
    if (lastTime == 0)
    {
      lastTime = highResTime;
      return;
    }
    int delta = highResTime - lastTime;
    lastTime = highResTime;

    _trans.rotate(toRadians(-90 * (delta / 1000)), (this.width / 2), (this.height / 2));
  }
  num toRadians(num degrees)
  {
    return (degrees / 180) * math.PI;
  }
}