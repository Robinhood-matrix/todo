import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/TodoModel.dart';
import 'package:todo/models/details.dart';

import 'home.dart';

class EditNote extends StatefulWidget {
  final TaskDetails note;
  const EditNote({Key? key, required this.note}) : super(key: key);

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  @override
  void initState() {
    _titleController.text = widget.note.title;
    _descController.text = widget.note.description;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.note.title),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<TodoModel>(context, listen: false).editNote(
                      widget.note.id,
                      _titleController.text,
                      _descController.text,
                      widget.note.time);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const ToDo()));
                },
                icon: const Icon(Icons.save_outlined)),
            IconButton(
              icon: const Icon(FontAwesomeIcons.trashAlt), //delete
              onPressed: () {
                Provider.of<TodoModel>(context, listen: false).deleteNote(
                    widget.note.id,
                    _titleController.text,
                    _descController.text,
                    widget.note.time);
                Get.snackbar("Deleted", "",
                    backgroundColor: Colors.redAccent,
                    snackPosition: SnackPosition.BOTTOM);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ToDo()));
              },
            )
          ],
        ),
        //Save Button
        body: Form(
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 10)),
                    Expanded(
                        child: TextFormField(
                      controller: _titleController,
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
                        child: TextFormField(
                      controller: _descController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
