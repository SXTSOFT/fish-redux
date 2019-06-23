import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';
import 'action.dart';

Widget toDoView(ToDo toDo, Dispatch dispatch, ViewService viewService) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    color: Colors.grey,
    child: Row(
      children: <Widget>[
        Expanded(
            child: Container(
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: Container(
                  key: ValueKey('remove-${toDo.id}'),
                  padding: const EdgeInsets.all(8.0),
                  height: 28.0,
                  color: Colors.yellow,
                  child: Text(
                    toDo.title,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  alignment: AlignmentDirectional.centerStart,
                ),
                onTap: () {
                  print('dispatch remove');
                  dispatch(
                      FAction(ToDoListAction.remove, payload: toDo.clone()));
                },
              ),
              GestureDetector(
                child: Container(
                  key: ValueKey('edit-${toDo.id}'),
                  padding: const EdgeInsets.all(8.0),
                  height: 60.0,
                  color: Colors.grey,
                  child: Text(toDo.desc, style: TextStyle(fontSize: 14.0)),
                  alignment: AlignmentDirectional.centerStart,
                ),
                onTap: () {
                  print('dispatch onEdit');
                  dispatch(FAction(ToDoAction.onEdit, payload: toDo.clone()));
                },
              )
            ],
          ),
        )),
        GestureDetector(
          child: Container(
            key: ValueKey('mark-${toDo.id}'),
            color: toDo.isDone ? Colors.green : Colors.red,
            width: 88.0,
            height: 88.0,
            child: Text(toDo.isDone ? 'done' : 'mark\ndone'),
            alignment: AlignmentDirectional.center,
          ),
          onTap: () {
            if (!toDo.isDone) {
              print('dispatch markDone');
              dispatch(FAction(ToDoAction.markDone, payload: toDo.clone()));
            }
          },
          onLongPress: () {
            print('dispatch broadcast');
            dispatch(FAction(ToDoAction.onBroadcast));
          },
        )
      ],
    ),
  );
}

bool toDoEffect(FAction action, Context<ToDo> ctx) {
  if (action.type == ToDoAction.onEdit) {
    print('onEdit');

    ToDo toDo = ctx.state.clone();
    toDo.desc = '${toDo.desc}-effect';

    ctx.dispatch(FAction(ToDoAction.edit, payload: toDo));
    return true;
  } else if (action.type == ToDoAction.onBroadcast) {
    ctx.pageBroadcast(FAction(ToDoAction.broadcast));
  } else if (action.type == Lifecycle.initState) {
    //print('!!! initState ${ctx.state}');
    return true;
  } else if (action.type == Lifecycle.dispose) {
    //print('!!! dispose ${ctx.state}');
    return true;
  }

  return false;
}

dynamic toDoEffectAsync(FAction action, Context<ToDo> ctx) {
  if (action.type == ToDoAction.onEdit) {
    return Future.delayed(Duration(seconds: 1), () => toDoEffect(action, ctx));
  }

  return null;
}

OnAction toDoHigherEffect(Context<ToDo> ctx) =>
    (FAction action) => toDoEffect(action, ctx);

ToDo toDoReducer(ToDo state, FAction action) {
  if (!(action.payload is ToDo) || state.id != action.payload.id) return state;

  print('onReduce:${action.type}');

  if (action.type == ToDoAction.markDone) {
    return state.clone()..isDone = true;
  } else if (action.type == ToDoAction.edit) {
    return state.clone()..desc = action.payload.desc;
  } else {
    return state.clone();
  }
}

bool shouldUpdate(ToDo old, ToDo now) {
  return old != now;
}

bool reducerFilter(ToDo toDo, FAction action) {
  return action.type == ToDoAction.edit || action.type == ToDoAction.markDone;
}
