import 'package:flutter/material.dart';
//import 'package:todoeyflutter/models/task.dart';
import 'package:todoeyflutter/models/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0,),
            child: Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: TextField(
              maxLines: null,
              expands: true,
              autofocus: true,
//              maxLines: null,
//              minLines: null,
//              expands: true,
              style: TextStyle(
                color: Colors.white,
              ),
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'E.g. Make Pancakes',
                fillColor: Colors.white,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepPurpleAccent,
                    width: 2.0,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                ),
              ),
              onChanged: (newText){
                newTaskTitle = newText;
              },
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 100.0,
              vertical: 20.0,
            ),
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
            child: Text('Add', style: TextStyle(fontSize: 18.0,),),
            onPressed: (){
              Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
