import 'package:flutter/cupertino.dart';
import 'package:todo_provider_app/models/TaskModel.dart';

class ToDoModel extends ChangeNotifier {
  List<TaskModel> taskList = [];

  addTaskInList() {
    TaskModel taskModel =
        TaskModel("title ${taskList.length}", "this is the task no detail");
    taskList.add(taskModel);

    notifyListeners();
  }
}
