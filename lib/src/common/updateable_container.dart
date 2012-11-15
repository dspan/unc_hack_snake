part of snake_common;

abstract class UpdateableContainer extends Updateable {
  final _updateables = new List<Updateable>();
  bool _initialized = false;

  Iterable<Updateable> get updateables => _updateables;

  void initialize() {
    _initialized = true;

    final copy = new List<Updateable>.from(this.updateables);
    for (var u in copy)
    {
      u.initialize();
    }
  }

  void addComponent(Updateable component) {
    _updateables.add(component);
    _updateables.sort((a, b) => a.updateOrder - b.updateOrder);

    if (_initialized)
    {
      component.initialize();
    }
  }

  void removeComponent(Updateable component) {
    _updateables.removeAt(_updateables.indexOf(component));

    if (_initialized && !component.isDisposed)
    {
      component.dispose();
    }
  }

  void update(GameTime gameTime) {
    super.update(gameTime);

    // using a copy protects us from changes in the list as we loop over it.
    final copy = new List<Updateable>.from(this.updateables);
    for (var u in copy)
    {
      if (u.enabled)
      {
        u.update(gameTime);
      }
    }
  }

  void disposeInternal()
  {
    for (var u in new List<Updateable>.from(this.updateables))
    {
      u.dispose();
    }
    _updateables.clear();
    _initialized = false;

    super.disposeInternal();
  }
}