// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      title: json['title'] as String,
      text: json['text'] as String,
      iscomplited: json['iscomplited'] as bool,
      date: json['date'] as String,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'text': instance.text,
      'iscomplited': instance.iscomplited,
      'date': instance.date,
    };
