import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/TodoModel.dart';
import 'package:todo/screens/editnotescreen.dart';
import 'package:todo/screens/tryHome.dart';
import 'package:provider/provider.dart';

class ToDo extends StatefulWidget {
  const ToDo({Key? key}) : super(key: key);

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("My Todo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView
          children: [
            ListTile(
              title: const Text('Go Back'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Home()));
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/add");
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.add_outlined,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<TodoModel>(
          builder: (context, todo, child) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  width: MediaQuery.of(context).size.width * 1,
                  child: Text(
                    "Remaining Tasks(${todo.returnCount().toString()})",
                    style: (const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ),
                ListView.builder(
                  itemCount: todo.taskList.length, //length of list
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) =>
                      GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditNote(
                              note: todo.taskList[index],
                            ),
                          ));
                    },
                    child: Container(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 10),
                        width: double.infinity,
                        height: 100,
                        decoration: BoxDecoration(
                          color: todo.taskList[index].isCompleted == true
                              ? Colors.green[400]
                              : Colors.grey[850],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            alignment: Alignment.centerRight,
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: Colors.white,
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              todo.taskList.removeAt(index);
                            });

                            if (direction == DismissDirection.endToStart) {
                              // ignore: deprecated_member_use
                              Scaffold.of(context).showSnackBar(const SnackBar(
                                  backgroundColor: Colors.black,
                                  content: Text(
                                    "Deleted",
                                    style: TextStyle(color: Colors.white),
                                  )));
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    todo.toggleCompleted(index);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 40, left: 10),
                                    child: Icon(
                                      CupertinoIcons.checkmark_alt_circle_fill,
                                      color: todo.taskList[index].isCompleted
                                          ? const Color(0xff00cf8d)
                                          : Colors.grey,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                //dedscription text

                                Container(
                                  padding: const EdgeInsets.only(
                                      bottom: 40, left: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    todo.taskList[index].title,
                                    style: (const TextStyle(
                                      height: 1.5,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                ),
                                //its for time but i have named it title for now
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  padding: const EdgeInsets.only(
                                      bottom: 40, left: 50),
                                  child: Text(
                                    (todo.taskList[index].time),
                                    style: (const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
