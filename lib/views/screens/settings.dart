import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/poral/settings_portal.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/widgets/custom_drower.dart';
import 'package:uzgaruvchi/views/widgets/to_do.dart';

String? required_color;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Color darkBody = AppConstants.bodyDark;
  Color lightBody = AppConstants.bodyLight;
  Color darkApp = AppConstants.appBarDark;
  Color lightApp = AppConstants.appBarLight;
  double newTextSize = AppConstants.textSize;

  double newTextsize = AppConstants.textSize;
  final textSizeController = TextEditingController();
  String selectedLanduage = "Uz";
  @override
  void initState() {
    super.initState();
  }

  void selectColor(Color initialColor, ValueChanged<Color> onColorChanged) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select color'),
          content: SingleChildScrollView(
            child: SlidePicker(
              pickerColor: initialColor,
              onColorChanged: onColorChanged,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    value: "Eng",
                    child: Text("Eng"),
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
        title: const Text(
          "Settings",
        ),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              value: SettingPortal.of(context).themeMode == ThemeMode.dark,
              onChanged: (value) {
                setState(() {
                  SettingPortal.of(context).onOff(value);
                });
              },
              title: Text(
                "Dark Mode",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                "Dark mode Body color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(darkBody, (color) {
                    setState(() {
                      required_color = color.toHexString();

                      darkBody = color;
                      AppConstants.bodyDark = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Light mode Body color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightBody, (color) {
                    setState(() {
                      lightBody = color;
                      AppConstants.bodyLight = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Dark mode App Bar color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(darkApp, (color) {
                    setState(() {
                      darkApp = color;
                      AppConstants.appBarDark = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Light mode App Bar color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightApp, (color) {
                    setState(() {
                      lightApp = color;
                      AppConstants.appBarLight = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            const Gap(10),
            ListTile(
              title: Text(
                "text size",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Set size',
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: AppConstants.textColor),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              decoration:
                                  const InputDecoration(hintText: "Size"),
                              controller: textSizeController,
                            )
                          ],
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              newTextSize =
                                  double.parse(textSizeController.text);
                              noteControllers.saveData(
                                newTextSize,
                                required_color!,
                              );

                              setState(() {});
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "set size",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            ),
            ListTile(
              title: Text(
                "text color",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: AppConstants.textColor),
              ),
              trailing: TextButton(
                onPressed: () {
                  selectColor(lightApp, (color) {
                    setState(() {
                      lightApp = color;
                      AppConstants.textColor = color;
                    });
                  });
                },
                child: Text(
                  "Select color",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: AppConstants.textColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
