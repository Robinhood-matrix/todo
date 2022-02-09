import 'package:flutter/cupertino.dart';
import 'package:todo/models/details.dart';

class TodoModel extends ChangeNotifier {
  List<TaskDetails> taskList = [];
  int id = 0;
  addTaskList(TaskDetails task) {
    //TaskDetails taskDetails =TaskDetails("Time ${taskList.length}", "Task details");
    taskList.add(task);
    notifyListeners();
  }

  void toggleCompleted(int index) {
    taskList[index].isCompleted = !taskList[index].isCompleted;
    notifyListeners();
  }

  int returnCount() {
    int count = 0;
    for (var e in taskList) {
      if (e.isCompleted == false) {
        count = count + 1;
      }
    }
    return count;
  }

  void editNote(int id, String title, String description, String time) {
    final note =
        TaskDetails(id: id, title: title, description: description, time: time);

    taskList[taskList.indexWhere((note) => note.id == id)] = note;

    notifyListeners();
  }

  void deleteNote(int id, String title, String description, String time) {
    final note =
        TaskDetails(id: id, title: title, description: description, time: time);
    taskList[taskList.indexWhere((note) => note.id == id)] = note;
    taskList.remove(note);
    notifyListeners();
  }
}
