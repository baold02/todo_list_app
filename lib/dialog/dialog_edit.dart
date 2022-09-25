import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllors/todo_controllor.dart';
import '../models/todo_model.dart';
class EditDialog extends StatefulWidget {
  final TodoModel todoModel;
  const EditDialog({Key? key, required this.todoModel}) : super(key: key);

  @override
  State<EditDialog> createState() => _EditDialogState();
}

class _EditDialogState extends State<EditDialog> {
  late String title =titleControllor.text;
  late String des = descController.text;

// String get todoId => ModalRoute.of(context)!.settings.arguments== null ? "Null": ModalRoute.of(context)!.settings.arguments as String;

  TodoControllor get _controllor => context.read<TodoControllor>();
  final _formKey =GlobalKey<FormState>();
  // String? title;
  // String? description;
  final titleControllor = TextEditingController();
  final descController = TextEditingController();
  int index = 0;
  @override
  void initState() {
    Future.delayed(Duration.zero,() {
        titleControllor.text = widget.todoModel.title;
        descController.text = widget.todoModel.Descripton;
        // index++;

    });

    //description = widget.todoModel.Descripton;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // print('id'+ todoId);
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit',
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
                  if(_formKey.currentState?.validate()?? false){
                      _controllor.updateTodo( widget.todoModel ,title,des);

                        Navigator.pop(context);
                  }
                },child: Text('Edit'),))
          ],
        ),
      ),
    );
  }
}
