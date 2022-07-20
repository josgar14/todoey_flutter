import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.tasksTitle, this.isChecked, this.checkboxCallback,
      this.longPressCallback, // Josue: Initialize our VoidCallback.
      {Key? key})
      : super(key: key);

  final bool isChecked;
  final String tasksTitle;
  final Function(bool?) checkboxCallback;
  //final void Function() longPressCallback;
  final VoidCallback longPressCallback; // Josue: define our VoidCallback.

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback, // Josue: and here we use the callbck.
      title: Text(
        tasksTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked, //checkboxState,
        onChanged: checkboxCallback,
      ),
    );
  }
}
