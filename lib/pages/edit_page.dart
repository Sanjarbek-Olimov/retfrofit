import 'package:flutter/material.dart';
import 'package:retfrofit_app/models/notes_model.dart';
import 'package:retfrofit_app/services/retrofit_service.dart';
import 'package:dio/dio.dart';

class EditPage extends StatefulWidget {
  final Note note;

  const EditPage({Key? key, required this.note}) : super(key: key);

  static const id = "/edit_page";

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  void _apiPostUpdate(Note note) async{
    note.title = titleController.text.trim();
    note.date = DateTime.now();
    note.content = contentController.text.trim();

    final dio = Dio();
    final network = RetrofitNetwork(dio);
    network.updateNote(note.id!, note);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _apiPostUpdate(widget.note);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Edit Page"),
          actions: [
            TextButton(
              onPressed: () => _apiPostUpdate(widget.note),
              child: const Text(
                "Save",
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
                child: Text("Edit title"),
              ),
              TextField(
                controller: titleController..text = widget.note.title ?? '',
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5.0),
                child: Text("Edit content"),
              ),
              TextField(
                controller: contentController..text = widget.note.content ?? '',
                maxLines: null,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}