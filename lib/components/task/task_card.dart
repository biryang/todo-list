import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  TaskCard({this.isChecked , this.taskText, this.taskTag, this.checkCallBack, this.removeCallBack});

  final bool isChecked;
  final String taskText;
  final String taskTag;
  final Function checkCallBack;
  final Function removeCallBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: GestureDetector(
        onTap: checkCallBack,
        onLongPress: removeCallBack,
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
              Checkbox(
                value: isChecked,
                activeColor: Colors.blue,
                onChanged: (value){},
              ),
              Text(
                taskText,
                style: TextStyle(
                    color: Colors.white,
                    decoration: isChecked ? TextDecoration.lineThrough : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}