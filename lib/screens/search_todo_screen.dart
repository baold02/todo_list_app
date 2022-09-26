import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/widgets/todo_item.dart';

import '../controllors/todo_controllor.dart';
import '../models/todo_model.dart';
class SearchScreen extends StatefulWidget {
  static const routeName = '/todo-serch';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final controller = TextEditingController();
  List<TodoModel> todos1 = TodoControllor().todos;
  TodoControllor get todoController => context.read<TodoControllor>();
  void seacrh(String value){
    setState(() {
      todoController.search(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Todo title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.blue)
                    )
                ),
                onChanged: (value) =>seacrh(value),
              ),
            ),
            Expanded(
                child: Consumer<TodoControllor>(builder: (context,controller,_){
                  return ListView.builder(
                    itemCount: controller.getListSeacrh.length,
                      itemBuilder: (context,index){
                    return TodoItem(todoModel: controller.getListSeacrh[index]);

                  });
                },)
            )
          ]
      ),
    );

  }



}



