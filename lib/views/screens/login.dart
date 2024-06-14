import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/screens/home_screen.dart';

class PasswordCheck extends StatefulWidget {
  final ValueChanged<bool> onThemeModeChanged;
  const PasswordCheck({super.key,required this.onThemeModeChanged});

  @override
  State<PasswordCheck> createState() => _PasswordCheckState();
}

class _PasswordCheckState extends State<PasswordCheck> {
  void changeThemeMode(bool isDark) {
    AppConstants.themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  late TextEditingController passwordController1;
  late TextEditingController passwordController2;
  late TextEditingController passwordController3;
  late TextEditingController passwordController4;
  late FocusNode focusNode1;
  late FocusNode focusNode2;
  late FocusNode focusNode3;
  late FocusNode focusNode4;
  String passwordError1 = '';

  int failCounter = 0;

  @override
  void initState() {
    super.initState();
    passwordController1 = TextEditingController();
    passwordController2 = TextEditingController();
    passwordController3 = TextEditingController();
    passwordController4 = TextEditingController();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
  }

  @override
  void dispose() {
    passwordController1.dispose();
    passwordController2.dispose();
    passwordController3.dispose();
    passwordController4.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    super.dispose();
  }

  void validatePassword() {
    String password = passwordController1.text +
        passwordController2.text +
        passwordController3.text +
        passwordController4.text;

    if (password != AppConstants.password) {
      failCounter++;
      setState(() {
        passwordError1 = "$failCounter Failed Passcode Attempt";
      });
    }
    if (password == AppConstants.password) {
      failCounter = 0;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) {
            return HomeScreen();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  controller: passwordController1,
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    }
                  },
                  focusNode: focusNode1,
                ),
              ),
              const Gap(20),
              SizedBox(
                width: 50,
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  controller: passwordController2,
                  focusNode: focusNode2,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focusNode1);
                    } else if (value.length == 1) {
                      FocusScope.of(context).requestFocus(focusNode3);
                    }
                  },
                ),
              ),
              const Gap(20),
              SizedBox(
                width: 50,
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  controller: passwordController3,
                  focusNode: focusNode3,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focusNode2);
                    } else if (value.length == 1) {
                      FocusScope.of(context).requestFocus(focusNode4);
                    }
                  },
                ),
              ),
              const Gap(20),
              SizedBox(
                width: 50,
                child: TextField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  controller: passwordController4,
                  focusNode: focusNode4,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      FocusScope.of(context).requestFocus(focusNode3);
                    } else if (value.length == 1) {
                      validatePassword();
                    }
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            failCounter > 0 ? passwordError1 : "",
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
