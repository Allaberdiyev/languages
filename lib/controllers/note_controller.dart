import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uzgaruvchi/models/note.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/utils/extensions/extension.dart';

class NoteController {
  Color darkBody = AppConstants.bodyDark;
  Color lightBody = AppConstants.bodyLight;
  Color darkApp = AppConstants.appBarDark;
  Color lightApp = AppConstants.appBarLight;
  double newTextSize = AppConstants.textSize;
  String? password = AppConstants.password;
  final List<Note> _list = [
    Note(
        title: "Lesson",
        text: "1:00 dushanba shanba",
        iscomplited: false,
        date: "2024-01-2 "),
    Note(
        title: "Flutter",
        text: "7:00 dushanba shanba",
        iscomplited: true,
        date: "2024-4-12 "),
    Note(
        title: "Jv",
        text: "4:00 dushanba shanba",
        iscomplited: false,
        date: "2024-03-3 "),
    Note(
        title: "Python",
        text: "2:00 dushanba shanba",
        iscomplited: true,
        date: "2024-5-5 "),
  ];

  List<Note> get list {
    return [..._list];
  }

  void add(String title, String text) {
    _list.add(
      Note(
        title: title,
        text: text,
        iscomplited: false,
        date: DateTime.now().dateTimeFormat(),
      ),
    );
  }

  Future<void> saveData(double newTextSize, String color) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble("textSize", newTextSize);
    sharedPreferences.setString("password", password!);
    sharedPreferences.setString("darkBody", color);
  }

  Future<void> getData(double? newTextSize) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    newTextSize = sharedPreferences.getDouble("textSize");
    password = sharedPreferences.getString("password");
    darkBody = Color(int.parse('0x${sharedPreferences.getString("darkBody")}'));
  }

  void edit({
    required int index,
    required String title,
    required String text,
  }) {
    _list[index].text = text;
    _list[index].title = title;
  }

  void delete(int index) {
    _list.removeAt(index);
  }
}
