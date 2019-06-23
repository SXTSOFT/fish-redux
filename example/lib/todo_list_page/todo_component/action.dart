import 'package:fish_redux/fish_redux.dart';
import 'state.dart';

enum ToDoAction { onEdit, edit, done, onRemove, remove }

class ToDoActionCreator {
  static FAction onEditAction(String uniqueId) {
    return FAction(ToDoAction.onEdit, payload: uniqueId);
  }

  static FAction editAction(ToDoState toDo) {
    return FAction(ToDoAction.edit, payload: toDo);
  }

  static FAction doneAction(String uniqueId) {
    return FAction(ToDoAction.done, payload: uniqueId);
  }

  static FAction onRemoveAction(String uniqueId) {
    return FAction(ToDoAction.onRemove, payload: uniqueId);
  }

  static FAction removeAction(String uniqueId) {
    return FAction(ToDoAction.remove, payload: uniqueId);
  }
}
