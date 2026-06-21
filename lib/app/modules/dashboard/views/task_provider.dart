import 'package:flutter/material.dart';
import 'task_model.dart';
import 'package:provider/provider.dart';


class TaskProvider extends ChangeNotifier{
    final List<TaskModel> _tasks = [
      TaskModel(title: "Completed Flutters"),
      TaskModel(title: "Study more than one..."),
      TaskModel(title: "100%"),
    ];


    List<TaskModel> get task => _tasks;

    void addTask(String title){
        if(title.trim().isEmpty) return;

        task.add(
          TaskModel(title: title),
        );

          notifyListeners();
    }

    void toggleTask(int index){
        _tasks[index].isCompleted = !_tasks[index].isCompleted;

        notifyListeners();
    }



      void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  int get completedTasks =>
      _tasks.where((task) => task.isCompleted).length;
}





