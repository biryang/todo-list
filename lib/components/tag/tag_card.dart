import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  TagCard({this.tag});

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0), color: Colors.indigo, blurRadius: 3)
            ],
          ),
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                tag,
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
