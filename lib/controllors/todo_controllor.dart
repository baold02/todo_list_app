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

bool checkTodoStatus(TodoModel todoModel){
    todoModel.isDone = !todoModel.isDone;
    notifyListeners();
    return todoModel.isDone;
}

// TodoModel? findById(String? id){
//    return _list.firstWhere((element) => element?.id == id);
//}

 void RemoTodo(TodoModel todo){
    _list.remove(todo);
    notifyListeners();
 }

 void xapXep(){
  _list.sort((a, b) => a.title.compareTo(b.title));
 }

 void newset(){
    _list.sort((c,d)=>c.id.toString().compareTo(d.id.toString()));
 }
}