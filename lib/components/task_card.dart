
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo[900],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 0),
                color: Colors.indigo,
                blurRadius: 3)
          ],
        ),
        child: Row(
          children: [
            Checkbox(value: true, onChanged: null),
            Text(
              'test',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
