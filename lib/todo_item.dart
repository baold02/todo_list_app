import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_list_app/controllors/todo_controllor.dart';
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
                          DelelteTodo(context, todoModel)
              },
                icon: Icons.delete,
              ),

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
        Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(todoModel.title,
                    style: TextStyle(
                          color: Theme.of(context).primaryColor,
                         fontSize: 22
                    ),
                  ),
                Text(todoModel.Descripton,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22
                  ),
                )
              ],
            ) )
     ],

   ),
   );


    void DelelteTodo(BuildContext context,TodoModel todoModel){
       final provider = Provider.of<TodoControllor>(context,listen: false);
       provider.RemoTodo(todoModel);
    }
}
