class DataBaseActitivyModel {
  int id;
  String title;
  String coursename;
  int priority;
  int timestart;

  DataBaseActitivyModel(
      {this.id,
      this.title,
      this.coursename,
      this.priority = 0,
      this.timestart});

  factory DataBaseActitivyModel.fromJson(Map<String, dynamic> parsedJson) =>
      DataBaseActitivyModel(
          id: parsedJson['id'],
          title: parsedJson['title'],
          coursename: parsedJson['coursename'],
          priority: parsedJson['priority'],
          timestart: parsedJson['timestart']);

  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "title": this.title,
      "coursename": this.coursename,
      "priority": this.priority,
      "timestart": this.timestart,
    };
  }

  @override
  String toString() {
    return 'id: $id, title: $title, coursename: $coursename, priority: $priority, timestart: $timestart';
  }
}
