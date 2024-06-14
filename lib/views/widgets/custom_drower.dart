import 'package:flutter/material.dart';
import 'package:uzgaruvchi/utils/app_constats.dart';
import 'package:uzgaruvchi/views/screens/home_screen.dart';
import 'package:uzgaruvchi/views/screens/settings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(color: AppConstants.textColor),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const HomeScreen();
                  },
                ),
              );
            },
            leading: Icon(
              (Icons.home),
              color: AppConstants.textColor,
            ),
            title: Text(
              "Home Page",
              style: TextStyle(color: AppConstants.textColor),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const SettingsScreen();
                  },
                ),
              );
            },
            leading: Icon(
              (Icons.settings),
              color: AppConstants.textColor,
            ),
            title: Text(
              "Settings",
              style: TextStyle(color: AppConstants.textColor),
            ),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
