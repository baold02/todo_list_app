import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/dialog/dialog_add.dart';
import 'package:todo_list_app/dialog/dialog_edit.dart';
import 'package:todo_list_app/todo_item.dart';
import 'package:todo_list_app/todo_list.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TodoControllor(),
    child: MaterialApp(home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    )
  )
      );
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Todo App',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),backgroundColor: Colors.white,),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: (){
              showDialog(
                  context: context,
                  builder: (context) => AddTodo(),
                  barrierDismissible: false,
              );
          },
          child:  Icon(Icons.add,),
        ),
      body: TodoList(),

      );


  }

}



