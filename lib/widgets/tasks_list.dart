import 'package:flutter/material.dart';
import 'tasks_tile.dart';
import 'package:provider/provider.dart'; //Josue: import provider
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //Josue: provide the data type in between <> this should be the name of the class where you're getting the data from.
      builder: (BuildContext context, taskData, Widget? child) {
        //Josue: pass the context, taskData is the name we provide, this can be anything you want and finally child.
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(task.name,
                task.isDone, //Josue: (taskData.tasks[index].name) this is how wee access the data.
                (bool? checkboxState) {
              taskData.updateTask(task);
            }, () {
              taskData.deleteTask(task);
            } // todo: add the delete method.
                );
          },
          itemCount: taskData.taskCount,
          // Josue: And this is how we use the getter.
        );
      },
    );
  }
}
