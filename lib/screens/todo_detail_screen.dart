import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/models/todo_model.dart';
class TodoDetailsScreen extends StatefulWidget {
  static const routeName = '/todo-detail';
  const TodoDetailsScreen({Key? key}) : super(key: key);

  @override
  State<TodoDetailsScreen> createState() => _TodoDetailsScreenState();
}

class _TodoDetailsScreenState extends State<TodoDetailsScreen> {
  String get todoId => ModalRoute.of(context)?.settings.arguments as String;
  TodoModel? get  loadTodo => context.read<TodoControllor>().findById(todoId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loadTodo?.title ?? ""),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
           Row(
             children: [
               Text("Mo Ta"),
               Text(loadTodo?.Descripton?? ""),
             ],
           ),
            Text(loadTodo?.id.toString() ??"" ,
            style: TextStyle(
              color: Colors.red
            ),
            )
          ],
        ),
      ),
    );
  }
}
