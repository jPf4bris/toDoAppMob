import 'package:flutter/material.dart';
import 'package:flutter_to_do/models/tarefa.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
  ];

  List<Task> get tasks => _tasks;

  //funcao p criar uma tarefa
  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }
  //remover tarefa
  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
  //dar o check de completar tarefa
  void checkTask(int index) {
  _tasks[index].toggleCompletion();
  notifyListeners();
  }
}
