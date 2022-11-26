import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/TodoModel.dart';
import 'package:todo/models/details.dart';
import 'package:todo/screens/home.dart';

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ), //Save Button
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<TodoModel>(context, listen: false).addTaskList(
                    TaskDetails(
                        id: Provider.of<TodoModel>(context, listen: false).id++,
                        isUpdating: false,
                        description: descController.text,
                        title: titleController.text,
                        time: DateFormat.MMMd('en_US').format(DateTime.now())));
                Get.snackbar("Saved", "Your tasks has been saved",
                    backgroundColor: Colors.green[400],
                    snackPosition: SnackPosition.BOTTOM);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ToDo()));
              },
              icon: const Icon(Icons.save_outlined)),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(left: 10)),
                Expanded(
                    child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(hintText: "Title"),
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight
                        .w400, //onchanged local //text editing controller imp/
                  ),
                )),
              ],
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Expanded(
                    child: TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                      hintText: "Notes", border: InputBorder.none),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
