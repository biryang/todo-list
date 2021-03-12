class Task {
  final String text;
  final String tag;
  bool isDone;

  Task({this.text, this.tag, this.isDone});

  void toggleDone() {
    isDone = !isDone;
  }
}
