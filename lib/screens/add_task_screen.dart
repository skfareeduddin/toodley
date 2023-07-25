import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toodley/models/task.dart';
import 'package:toodley/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? newTaskTitle;

    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 80.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Add Text',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
              TextField(
                autofocus: true,
                autocorrect: true,
                onChanged: (newText) {
                  newTaskTitle = newText;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle!);
                  Navigator.pop(context);
                },
                child: const Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
