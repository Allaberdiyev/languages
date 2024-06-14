import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/widgets/custom_drower.dart';
import 'package:uzgaruvchi/views/widgets/to_do.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedLanduage = "Uz";

  @override
  void initState() {
    print(selectedLanduage);
    print(selectedLanduage.runtimeType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedLanduage == "Ru"
              ? "Новое Напоминание"
              : selectedLanduage == "En"
                  ? "New note"
                  : "Yangi Eslatma",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Row(
            children: [
              DropdownButton(
                value: selectedLanduage,
                items: const [
                  DropdownMenuItem(
                    value: "Uz",
                    child: Text("Uz"),
                  ),
                  DropdownMenuItem(
                    value: "Ru",
                    child: Text("Ru"),
                  ),
                  DropdownMenuItem(
                    value: "En",
                    child: Text("En"),
                  )
                ],
                onChanged: (newvalue) {
                  setState(() {
                    selectedLanduage = newvalue!;
                  });
                },
              ),
              const Gap(20)
            ],
          ),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const ToDO(
        
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          setState(
            () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      backgroundColor: const Color.fromARGB(255, 35, 33, 33),
                      title: Text(
                        selectedLanduage == "Ru"
                            ? "Новый Напоминание"
                            : selectedLanduage == "En"
                                ? "New note"
                                : "Yangi Eslatma",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                              controller: titalcontrollerAdd,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.white,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                labelText: "Title",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 3,
                              cursorColor: Colors.white,
                              controller: textcontrollerAdd,
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                                labelText: "Note",
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                noteControllers.add(titalcontrollerAdd.text,
                                    textcontrollerAdd.text);
                                Navigator.pop(context);
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text("Add"),
                        ),
                      ],
                    );
                  });
            },
          );
        },
        icon: Icon(
          Icons.add,
          color: AppConstants.textColor,
          size: 45,
        ),
      ),
    );
  }
}
