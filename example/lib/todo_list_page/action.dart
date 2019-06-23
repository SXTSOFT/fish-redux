import 'package:fish_redux/fish_redux.dart';
import 'todo_component/component.dart';

enum PageAction { initToDos, onAdd }

class PageActionCreator {
  static FAction initToDosAction(List<ToDoState> toDos) {
    return FAction(PageAction.initToDos, payload: toDos);
  }

  static FAction onAddAction() {
    return const FAction(PageAction.onAdd);
  }
}
