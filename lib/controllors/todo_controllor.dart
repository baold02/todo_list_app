import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoControllor extends ChangeNotifier{
  final List<TodoModel> _list = [];
  List<TodoModel> get todos => _list.where((todo) => todo.isDone == false).toList();
  List<TodoModel> get todosCompleted => _list.where((element) => element.isDone == true).toList();


  void AddTodo(TodoModel model){
  _list.add(model);
  notifyListeners();
 }

void updateTodo( TodoModel  todoModel, String title, String des){
        todoModel.title = title;
        todoModel.Descripton = des;
        notifyListeners();

}

 void sortString(List<TodoModel> model) {
 }

 void RemoTodo(TodoModel todo){
    _list.remove(todo);
    notifyListeners();
 }
}