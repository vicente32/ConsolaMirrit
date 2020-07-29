import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../pages/general/menuppal_page.dart';
import '../pages/general/settings_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu-img.jpg'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text("Home"),
            onTap: () => Navigator.pushReplacementNamed(
                context, MenuPrincipalPage.routName),
          ),
          ListTile(
            leading: Icon(Icons.pages, color: Colors.blue),
            title: Text("Settings"),
            onTap: () =>
                Navigator.pushReplacementNamed(context, SettingsPage.routName),
          ),
          ListTile(
              leading: Icon(Icons.pages, color: Colors.blue),
              title: Text("Versión"),
              onTap: () {}),
          ListTile(
              leading: Icon(Icons.pages, color: Colors.blue),
              title: Text("Salir"),
              onTap: () => SystemNavigator.pop())
        ],
      ),
    );
  }
}
