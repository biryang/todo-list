import 'package:flutter/material.dart';
import 'package:todo_list_app/components/task_card.dart';
import 'package:todo_list_app/models/task.dart';

class TasksList extends StatefulWidget {
  TasksList({this.tasks});

  final List<Task> tasks;

  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskCard(
          isChecked: widget.tasks[index].isDone,
          taskText: widget.tasks[index].text,
          taskTag: widget.tasks[index].tag,
          checkCallBack: () {
            setState(() {
              widget.tasks[index].toggleDone();
            });
          },
        );
      },
      itemCount: widget.tasks.length,
    );
  }
}
