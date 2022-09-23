import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/todo_item.dart';
class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoControllor>(context);
    final todos = provider.todos;
    return todos.isEmpty ?
           Center(
            child: Text(
              'No todos',
              style: TextStyle(fontSize: 20),
            ),
           ):
        ListView.separated(
            itemBuilder: (context, index) {
               final todo = todos[index];
                return TodoItem(todoModel:todo);
            },
            separatorBuilder: (context,index)=> Container(height: 8,),
            itemCount: todos.length);
  }
}
