import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/components/tasks_list.dart';
import 'package:todo_list_app/models/task.dart';

import 'add_task_bottom_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<Task> tasks = [
    Task(text: 'test1', tag: 'work'),
    Task(text: 'test1', tag: 'work'),
    Task(text: 'test1', tag: 'work'),
    Task(text: 'test1', tag: 'work'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff344fa1),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue[500],
          child: Icon(Icons.add),
          onPressed: () {
            print('add float');
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.top),
                  child: AddTaskBottomScreen((newText, newTag) {
                    setState(() {
                      print(newText);
                      print(newTag);
                      tasks.add(Task(text: newText, tag: newTag));
                    });
                    Navigator.pop(context);
                  }),
                ),
              ),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.list,
                      size: 30,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Todo List',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'TODAY\'S TASKS',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: TasksList(
                  tasks: tasks,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
