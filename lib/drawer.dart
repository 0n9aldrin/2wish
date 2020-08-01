import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;
  DrawerWidget({this.context});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('User phone number'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Donate to organisation'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Donate item'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/second');
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text('Organisation'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/organisation');
            },
          ),
        ],
      ),
    );
  }
}
