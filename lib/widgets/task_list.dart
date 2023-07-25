import 'package:flutter/material.dart';
import 'package:toodley/models/task_data.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final currentTask = taskData.tasks[index];
            return TaskTile(
              taskTitle: currentTask.name,
              isChecked: currentTask.isDone,
              checkboxCallback: (bool? checkboxState) {
                taskData.updateTask(currentTask);
              },
              longPressCallback: () {
                taskData.deleteTask(currentTask);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
