import 'package:flutter/material.dart';
import 'package:todo_list_app/components/task_card.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TaskCard(),
        TaskCard(),
      ],
    );
  }
}
