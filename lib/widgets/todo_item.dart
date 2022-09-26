import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
import 'package:todo_list_app/dialog/dialog_edit.dart';
import 'package:todo_list_app/models/todo_model.dart';
class TodoItem extends StatelessWidget {
  final TodoModel todoModel;
  const TodoItem({Key? key,required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          endActionPane: ActionPane(
             motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) => {
                        showDialog(context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Delete ${todoModel.title}'),
                            content: Text('You sure want to delete this item?'),
                            actions: [
                              TextButton(onPressed: (){
                                DelelteTodo(context, todoModel);
                                Navigator.pop(context);
                              }, child: Text('Ok',style: TextStyle(color: Colors.red),)),
                              TextButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, child: Text('Cancel')),

                            ],
                          ),)
              },
                icon: Icons.delete,
              ),
              SlidableAction(
                  onPressed: (context)  {
                  showDialog(
                  context: context,
                  builder: (context) => EditDialog(todoModel: todoModel) ,
                  barrierDismissible: false,
                  );
                  },
               icon: Icons.edit,
              )

            ],
          ),


           child: buildTodo(context),
        )
    );
  }
   Widget buildTodo(BuildContext context) => GestureDetector(
     onTap: (){

     },
   child:  Row(
     children: [
       Icon(Icons.abc),
        SizedBox(width: 20,),
        Expanded(
            child:Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.red

                ),
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                      todoModel.title,
                      style: TextStyle(
                            color: Colors.black,
                           fontSize: 20,
                           fontWeight: FontWeight.bold
                      ),
                    ),
                  SizedBox(height: 5,),
                  Text(
                    todoModel.Descripton,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13
                    ),
                  ),
                  // Text('Create Date: ${todoModel.id}')
                ],
              ),
            ) ),
     ],

   ),
   );


    void DelelteTodo(BuildContext context,TodoModel todoModel){
       final provider = Provider.of<TodoControllor>(context,listen: false);
       provider.RemoTodo(todoModel);
    }

  
}



