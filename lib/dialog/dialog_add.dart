import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/models/todo_model.dart';
class AddTodo extends StatefulWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TodoControllor get _controller => context.read<TodoControllor>();
  final _formKey = GlobalKey<FormState>();
  final titleControllor = TextEditingController();
  final descController = TextEditingController();

  // String RandomId(){
  //    final r = Random();
  //    const ac = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  //    return List.generate(6, (index) => ac[r.nextInt(ac.length)]).join();
  //}

  @override
  Widget build(BuildContext context)  => AlertDialog(
    content: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Todo',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: titleControllor,
            decoration: InputDecoration(hintText:'title'),
            validator: (value)  {
                if(value == null || value.isEmpty){
                    return 'phải nhập trường title';
                }
            },
          ),
          TextFormField(
            controller: descController,
            decoration: InputDecoration(hintText:'Descripton'),
            validator: (value) {
              if(value == null || value.isEmpty){
                return ' phải nhập nội dung';
              }
            },
          ),

          Container(
              width: 200,
              padding: EdgeInsets.only(top: 10),
              child: ElevatedButton(onPressed: (){
                if(_formKey.currentState?.validate() ?? false){
                    _controller.AddTodo(TodoModel(
                        id: DateTime.now().toString(),
                        title: titleControllor.text,
                        Descripton: descController.text));
                    print(titleControllor);
                    print(descController);
                    Navigator.pop(context);
                }
              },child: Text('Add'),))
        ],
      ),
    ),
  );
}
