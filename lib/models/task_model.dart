class TaskModel {
  final int id;
  final String text;
  final String tag;
  final String done;
  final String time;

  TaskModel({this.id, this.text, this.tag, this.done, this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'tag': tag,
      'done': done,
      'time': time
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return """
      TaskModel {
        id: $id, 
        text: $text, 
        tag: $tag, 
        done: $done, 
        time: $time
      }
    """;
  }
}