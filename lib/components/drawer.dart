import 'package:flutter/material.dart';
import 'package:two_wish/constants.dart';
import 'package:two_wish/models/user.dart';
import 'package:two_wish/services/auth.dart';

class DrawerWidget extends StatelessWidget {
  final BuildContext context;
  DrawerWidget({this.context});

  @override
  Widget build(BuildContext context) {
    CustomUser user = AuthService().getCurrentUser();
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Phone number:"),
                Text(user.phoneNumber),
              ],
            ),
            decoration: BoxDecoration(
              color: kPrimaryColour,
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
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
            leading: Icon(Icons.account_balance),
            title: Text('Organisations'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/organisation');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Success Stories'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/success');
            },
          ),
        ],
      ),
    );
  }
}
