import 'package:fish_redux/fish_redux.dart';

enum ToDoEditAction { update, done }

class ToDoEditActionCreator {
  static FAction update(String name, String desc) {
    return FAction(
      ToDoEditAction.update,
      payload: <String, String>{'name': name, 'desc': desc},
    );
  }

  static FAction done() {
    return const FAction(ToDoEditAction.done);
  }
}
