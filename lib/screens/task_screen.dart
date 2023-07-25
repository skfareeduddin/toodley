import 'package:flutter/material.dart';
import 'package:toodley/screens/add_task_screen.dart';
import 'package:toodley/widgets/task_list.dart';
import 'package:toodley/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
          size: 30.0,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 40.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  'Toodley',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}
