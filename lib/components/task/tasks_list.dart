import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/components/task/task_card.dart';
import 'package:todo_list_app/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskCard(
              isChecked: task.done == 'uncheck' ? false : true,
              taskText: task.text,
              taskTag: task.tag,
              checkCallBack: () {
                  taskData.toggleTask(task);
              },
              removeCallBack: (){
                taskData.removeTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
