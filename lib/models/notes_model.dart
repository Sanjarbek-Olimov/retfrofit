import 'dart:convert';

class Note {
  String? id;
  DateTime? date;
  String? title;
  String? content;

  Note({
    this.id,
    this.date,
    this.title,
    this.content,
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = DateTime.parse(json['date']);
    title = json['title'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toString(),
    'title': title,
    'content': content,
  };

  static String encode(List<Note> notes) => json.encode(
      notes.map<Map<String, dynamic>>((note) => note.toJson()).toList());

  static List<Note> decode(String notes) =>
      json.decode(notes).map<Note>((item) => Note.fromJson(item)).toList();
}
