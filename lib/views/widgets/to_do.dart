import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/controllers/note_controller.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/screens/home_screen.dart';

class ToDO extends StatefulWidget {
  const ToDO({super.key});

  @override
  State<ToDO> createState() => _ToDOState();
}

final NoteController noteControllers = NoteController();
final titleController = TextEditingController();
final textController = TextEditingController();

final titalcontrollerAdd = TextEditingController();
final textcontrollerAdd = TextEditingController();
final noteController = TextEditingController();

int complitedCount = 3;

class _ToDOState extends State<ToDO> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            " $complitedCount ",
            style: TextStyle(
                fontSize: AppConstants.textSize, color: AppConstants.textColor),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: noteControllers.list.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        noteControllers.list[index].iscomplited
                            ? complitedCount--
                            : complitedCount++;
                        noteControllers.list[index].iscomplited =
                            !noteControllers.list[index].iscomplited;
                        setState(() {});
                      },
                      icon: Icon(noteControllers.list[index].iscomplited
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_outlined),
                      color: AppConstants.textColor,
                    ),
                    title: Text(
                      noteControllers.list[index].title,
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: AppConstants.textColor),
                    ),
                    subtitle: Text(
                      noteControllers.list[index].date,
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: AppConstants.textColor),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    PopupMenuButton<int>(
                                      iconColor: AppConstants.textColor,
                                      color: Colors.black,
                                      onSelected: (int result) {
                                        setState(
                                          () {
                                            result == 0
                                                ? showDialog(
                                                    context: context,
                                                    builder: (ctx) {
                                                      return AlertDialog(
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      AppConstants
                                                                          .textSize,
                                                                  color: AppConstants
                                                                      .textColor),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              setState(
                                                                () {
                                                                  noteControllers.edit(
                                                                      index:
                                                                          index,
                                                                      title: titleController
                                                                          .text,
                                                                      text: noteController
                                                                          .text);

                                                                  Navigator.pop(
                                                                      context);
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              );
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              foregroundColor:
                                                                  Colors.white,
                                                            ),
                                                            child: const Text(
                                                                "Save"),
                                                          ),
                                                        ],
                                                        backgroundColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                35, 33, 33),
                                                        content: Form(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TextFormField(
                                                                controller:
                                                                    titleController,
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                cursorColor:
                                                                    Colors
                                                                        .white,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppConstants
                                                                            .textSize,
                                                                    color: AppConstants
                                                                        .textColor),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: Colors.white)),
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                  labelText:
                                                                      "Title",
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color:
                                                                              Colors.grey),
                                                                ),
                                                              ),
                                                              const Gap(20),
                                                              TextFormField(
                                                                maxLines: 3,
                                                                cursorColor:
                                                                    AppConstants
                                                                        .textColor,
                                                                controller:
                                                                    noteController,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        AppConstants
                                                                            .textSize,
                                                                    color: AppConstants
                                                                        .textColor),
                                                                keyboardType:
                                                                    TextInputType
                                                                        .text,
                                                                decoration:
                                                                    InputDecoration(
                                                                  focusedBorder:
                                                                      const OutlineInputBorder(
                                                                          borderSide:
                                                                              BorderSide(color: Colors.white)),
                                                                  border:
                                                                      const OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(),
                                                                  ),
                                                                  labelText:
                                                                      "Note",
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color:
                                                                              AppConstants.textColor),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : showDialog(
                                                    context: context,
                                                    builder: (ctx) {
                                                      return AlertDialog(
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Cancel",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      AppConstants
                                                                          .textSize,
                                                                  color: AppConstants
                                                                      .textColor),
                                                            ),
                                                          ),
                                                          ElevatedButton(
                                                            onPressed: () {
                                                              setState(
                                                                () {
                                                                  noteControllers
                                                                      .delete(
                                                                          index);
                                                                },
                                                              );
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              foregroundColor:
                                                                  AppConstants
                                                                      .textColor,
                                                            ),
                                                            child: const Text(
                                                                "Remove"),
                                                          ),
                                                        ],
                                                        backgroundColor:
                                                            const Color
                                                                .fromARGB(255,
                                                                35, 33, 33),
                                                        content: const Icon(
                                                          CupertinoIcons
                                                              .exclamationmark_octagon,
                                                          size: 100,
                                                        ),
                                                      );
                                                    },
                                                  );
                                          },
                                        );
                                      },
                                      itemBuilder: (ctx) =>
                                          <PopupMenuEntry<int>>[
                                        PopupMenuItem<int>(
                                          value: 0,
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                                fontSize: AppConstants.textSize,
                                                color: AppConstants.textColor),
                                          ),
                                        ),
                                        PopupMenuItem(
                                          value: 1,
                                          child: Text(
                                            "Remove",
                                            style: TextStyle(
                                                fontSize: AppConstants.textSize,
                                                color: AppConstants.textColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 35, 33, 33),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  height: 250.h,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: SizedBox(
                                        child: Text(
                                      noteControllers.list[index].text,
                                      style: TextStyle(
                                          fontSize: AppConstants.textSize,
                                          color: AppConstants.textColor),
                                    )),
                                  ),
                                ),
                              ],
                            );
                          });
                      setState(() {});
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
