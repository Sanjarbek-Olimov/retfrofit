import 'package:flutter/material.dart';
import 'package:retfrofit_app/models/notes_model.dart';
import 'package:retfrofit_app/services/retrofit_service.dart';
import 'package:dio/dio.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key}) : super(key: key);

  static const id = "/create_page";

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void _apiNoteCreate() {
    Note note = Note();
    note.title = titleController.text;
    note.date = DateTime.now();
    note.content = contentController.text;

    final dio = Dio();
    final network = RetrofitNetwork(dio);
    network.createNote(note);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Page"),
        actions: [
          TextButton(
            onPressed: () => _apiNoteCreate(),
            child: const Text(
              "Create",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text("Enter title"),
            ),
            TextField(
              controller: titleController,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Text("Enter content"),
            ),
            TextField(
              controller: contentController,
              maxLines: null,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}