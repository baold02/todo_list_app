import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/dialog/dialog_add.dart';
import 'package:todo_list_app/dialog/dialog_edit.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/screens/todo_detail_screen.dart';
import 'package:todo_list_app/widgets/todo_item.dart';
import 'package:todo_list_app/widgets/todo_list.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => TodoControllor(),
    child: MaterialApp(home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
          TodoDetailsScreen.routeName:(context) =>TodoDetailsScreen()
      },
    ),
  )
      );
}

enum FilterOptions{A_Z, Newest}
class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TodoControllor get _controller => context.read<TodoControllor>();
  TodoModel? todoModel;
  var _showAZ = false;
  var _newest = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text('Todo App',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        ),),backgroundColor: Colors.white,
         actions: [
             PopupMenuButton(itemBuilder: (context) {

               return [
                 PopupMenuItem<int>(child: Text('A_Z'),value: 0,),
                 PopupMenuItem<int>(child: Text('Newset'),value: 1,)
               ];
             },
               onSelected: (value){
                 if(value==0){
                   setState(() {
                     _controller.xapXep();
                   });
                 }
                 if(value==1){
                  setState(() {
                    _controller.newset();
                  });
                 }
               },
                icon: Icon(Icons.more_vert,
                color: Colors.black),
             ),



    ]
        ),
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



