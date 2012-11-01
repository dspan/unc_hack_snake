class ObservableProperty
{
  ObservableProperty()
  {
    ChainableIObservable l = Observable.create((IObserver o) {});

  }
}
