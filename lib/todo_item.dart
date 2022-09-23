import 'package:flutter/material.dart';
import 'package:todo_list_app/models/todo_model.dart';
class TodoItem extends StatelessWidget {
  final TodoModel todoModel;
  const TodoItem({Key? key,required this.todoModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child:Container(
          child: buildTodo(context),
        )


    );
  }
   Widget buildTodo(BuildContext context) => GestureDetector(
     onTap: (){

     },
   child:  Row(
     children: [
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

}
