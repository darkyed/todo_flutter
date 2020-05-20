import 'package:flutter/foundation.dart';
import 'package:todoeyflutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [];
//  Task(name: 'Buy apples'),
//  Task(name: 'Buy milk'),
//  Task(name: 'Make lemonade'),

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void swipeTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
  bool isEmpty(){
    if (_tasks.length == 0){
      return true;
    }
    return false;
  }

}