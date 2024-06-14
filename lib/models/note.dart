import 'package:json_annotation/json_annotation.dart';
part 'note.g.dart';

@JsonSerializable()
class Note {
  String title;
  String text;
  bool iscomplited;
  String date;
  Note({
    required this.title,
    required this.text,
    required this.iscomplited,
    required this.date,
  });
}
