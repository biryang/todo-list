import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {


  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  bool isChecked = false;

  void checkboxCallback(bool checkboxState) {
    setState(() {
      isChecked = checkboxState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[900],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(offset: Offset(0, 0), color: Colors.indigo, blurRadius: 3)
          ],
        ),
        child: Row(
          children: [
            TaskCheckbox(
              checkboxState: isChecked,
              checkboxCallback: checkboxCallback,
            ),
            Text(
              'Test',
              style: TextStyle(
                  color: Colors.white,
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  TaskCheckbox({this.checkboxState, this.checkboxCallback});

  final Function checkboxCallback;
  final bool checkboxState;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: checkboxState,
      onChanged: checkboxCallback,
    );
  }
}
