import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoeyflutter/widgets/tasks_list.dart';
import 'package:todoeyflutter/screens/add_task_screen.dart';
//import 'package:todoeyflutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:todoeyflutter/screens/empty_list_screen.dart';

class TasksScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    bool listEmpty = Provider.of<TaskData>(context).isEmpty();
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.tealAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: (){
          showModalBottomSheet(context: context,
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
              
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen(),
                ),
              ),

          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                    radius: 30.0,
                    child: Icon(
                        Icons.list,
                      size: 30.0,
                      color: Colors.deepPurpleAccent,
                    ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'To Do',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15.0),
                  child: Text(
                    '${Provider.of<TaskData>(context).taskCount} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)
                ),
              ),

              child: listEmpty ? EmptyListDisplay() : TasksList() ,
            ),
          ),
        ],
      ),
    );
  }
}

