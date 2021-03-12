import 'package:flutter/material.dart';

class AddTaskBottomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Text',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(labelText: 'Tag'),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                elevation: 5,
              ),
              child: Text(
                'Add',
                style: TextStyle(color: Colors.white),
              ),
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
