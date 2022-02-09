import 'package:flutter/material.dart';
import 'package:todo/models/TodoModel.dart';

import 'package:todo/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/show_note.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TodoModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const ToDo(),
      routes: {
        "/add": (context) => const Task(),
      },
    );
  }
}

class Show extends StatelessWidget {
  const Show({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
