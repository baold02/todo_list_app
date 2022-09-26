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
        backgroundColor: Colors.red[200],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
           Row(
             children: [
               Container(
                 margin: EdgeInsets.only(right: 10),
                 child: Text("Công Việc:",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontSize: 20
                 ),),
               ),
               Text(loadTodo?.Descripton?? "",
               style: TextStyle(
                 fontSize: 20
               ),),
             ],
           ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin:  EdgeInsets.only(right: 10),
                    child: Text('Creat Date:',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    )),
                  ),
                  Text(loadTodo?.id.toString() ?? "" ,
                    style: TextStyle(
                        color:  Colors.red,
                        fontSize: 20
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
