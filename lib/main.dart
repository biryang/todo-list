import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task_data.dart';
import 'package:todo_list_app/screens/todo_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        home: TodoScreen(),
      ),
    );
  }
}
