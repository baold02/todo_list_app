import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/widgets/todo_item.dart';
// class TodoList extends StatelessWidget {
//    //bool order = false;
//   const TodoList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<TodoControllor>(context);
//     final todos = provider.todos;
//     return todos.isEmpty ?
//            Center(
//             child: Text(
//               'Empty',
//               style: TextStyle(fontSize: 20),
//             ),
//            ):
//         ListView.separated(
//             padding: EdgeInsets.all(30),
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//                 final sortItem =
//                final todo = sortItem[index];
//                 return TodoItem(todoModel:todo);
//             },
//             separatorBuilder: (context,index)=> Container(height: 8,),
//             itemCount: todos.length);
//   }
// }

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // bool check = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoControllor>(context);
    final todos = provider.todos;
    return todos.isEmpty ?
    Center(
      child: Text(
        'Empty',
        style: TextStyle(fontSize: 20),
      ),
    ):
    ListView.separated(
        padding: EdgeInsets.all(30),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final todo = todos[index];
          return TodoItem(todoModel:todo);
        },
        separatorBuilder: (context,index)=> Container(height: 8,),
        itemCount: todos.length);
  }
  }





