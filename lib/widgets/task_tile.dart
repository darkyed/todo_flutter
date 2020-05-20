import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function deleteCallback;
  final int indexForKey;
  final Function swipeCallback;
  TaskTile({this.isChecked, this.taskTitle, this.checkboxCallback, this.deleteCallback, this.indexForKey, this.swipeCallback});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      resizeDuration: Duration(milliseconds: 200),
      background: Container(
        color: Colors.deepPurpleAccent,
      ),
      key: Key(indexForKey.toString()),
      onDismissed: (direction){
        swipeCallback(indexForKey);
      },
      child: ListTile(
        onLongPress: deleteCallback,
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null,
            color: isChecked? Colors.grey.shade800: Colors.white,
          ),
        ),
        trailing: Theme(
          data: ThemeData(unselectedWidgetColor: Colors.grey.shade500),
          child: Checkbox(
            value: isChecked,
            activeColor: Colors.deepPurpleAccent,
            onChanged: checkboxCallback,
          ),
        ),
      ),
    );
  }
}

