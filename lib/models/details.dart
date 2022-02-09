class TaskDetails {
  final int id;
  final String title;
  final String description;
  final String time;
  bool isCompleted;
  bool isUpdating;

  int get getid => id;
  String get getTitle => title;
  String get getDescription => description;
  String get getTime => time;

  TaskDetails(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      this.isCompleted = false,
      this.isUpdating = false});


}

