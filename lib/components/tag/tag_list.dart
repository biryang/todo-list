import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/components/tag/tag_card.dart';
import 'package:todo_list_app/models/task_data.dart';

class TagList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final tag = taskData.tags[index];
            return TagCard(
              tag: tag,
            );
          },
          itemCount: taskData.tags.length,
        );
      },
    );
  }
}
