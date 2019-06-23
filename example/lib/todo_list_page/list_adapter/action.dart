import 'package:fish_redux/fish_redux.dart';
import '../todo_component/component.dart';

enum ToDoListAction { add }

class ToDoListActionCreator {
  static FAction add(ToDoState state) {
    return FAction(ToDoListAction.add, payload: state);
  }
}
