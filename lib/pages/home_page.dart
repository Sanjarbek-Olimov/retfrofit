import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:retfrofit_app/models/notes_model.dart';
import 'package:retfrofit_app/services/retrofit_service.dart';
import 'package:dio/dio.dart';

import 'create_page.dart';
import 'edit_page.dart';
class HomePage extends StatefulWidget {
  static const id = "/home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> notes = [];
  bool isNotLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiNoteList();
  }

  void _apiNoteList() {
    setState(() {
      isNotLoading = false;
    });

    final dio = Dio();
    final network = RetrofitNetwork(dio);

    network.getNotes().then((response) {
      notes = response;
      isNotLoading = true;
      setState(() {});
    });
  }

  void _apiNoteDelete(String id) {
    setState(() {
      isNotLoading = false;
    });
    final dio = Dio();
    final network = RetrofitNetwork(dio);
    network.deleteNote(int.parse(id)).then((value) {
      _apiNoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Networking"),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) => itemBuild(notes[index]),
          ),
          isNotLoading
              ? const SizedBox.shrink()
              : Container(
            color: Colors.blueGrey.withOpacity(0.45),
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
          setState(() {
            _apiNoteList();
          });
        },
        elevation: 10,
        child: const Icon(CupertinoIcons.plus),
      ),
      drawer: const Drawer(),
    );
  }

  Widget itemBuild(Note note) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        children: [
          /// * edit button
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.red.shade300,
            child: SlidableAction(
              onPressed: (context) => _apiNoteDelete(note.id!),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ),
        ],
      ),
      child: Card(
        child: ListTile(
          title: Text(note.title ?? "no title"),
          subtitle: Text(note.content ?? "no content"),
          trailing: Text(note.date!.toString().substring(0,10)),
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditPage(note: note),
              ),
            );
            setState(() {
              _apiNoteList();
            });
          },
        ),
      ),
    );
  }
}
