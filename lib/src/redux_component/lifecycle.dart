import '../redux/redux.dart';

enum Lifecycle {
  initState,
  didChangeDependencies,
  build,

  didUpdateWidget,
  deactivate,
  dispose,

  //adapter
  appear,
  disappear,
}

class LifecycleCreator {
  static FAction initState() => const FAction(Lifecycle.initState);

  static FAction build() => const FAction(Lifecycle.build);

  static FAction dispose() => const FAction(Lifecycle.dispose);

  static FAction didUpdateWidget() => const FAction(Lifecycle.didUpdateWidget);

  static FAction didChangeDependencies() =>
      const FAction(Lifecycle.didChangeDependencies);

  static FAction deactivate() => const FAction(Lifecycle.deactivate);

  static FAction appear(int index) => FAction(Lifecycle.appear, payload: index);

  static FAction disappear(int index) =>
      FAction(Lifecycle.disappear, payload: index);
}
