import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/components/tag/tag_card.dart';
import 'package:todo_list_app/components/tag/tag_list.dart';
import 'package:todo_list_app/components/task/tasks_list.dart';
import 'package:todo_list_app/models/task_data.dart';

import 'add_task_bottom_screen.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<TaskData>(context, listen: false).getTask();
  }

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
                  child: AddTaskBottomScreen(),
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
                    top: 30.0, left: 30.0, right: 30.0, bottom: 30.0),
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
                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'TAGS',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
            Container(height: 60, child: TagList()),
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
                  borderRadius: BorderRadius.only(),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
