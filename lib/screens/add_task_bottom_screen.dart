import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task_data.dart';

class AddTaskBottomScreen extends StatelessWidget {
  final textController = TextEditingController();
  final tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String newText;
    String newTag;

    return Container(
      color: Color(0xff274375),
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 50, right: 50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_box,
                  color: Colors.blue,
                  size: 35,
                ),
                Text(
                  'TASK',
                  style: TextStyle(fontSize: 30.0, color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: textController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Text',
              ),
              onChanged: (value) {
                newText = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: tagController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Tag'),
              onChanged: (value) {
                newTag = value;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 5,
              ),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if(newText != null && newTag != null) {
                  textController.clear();
                  tagController.clear();
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newText, newTag);
                }
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
