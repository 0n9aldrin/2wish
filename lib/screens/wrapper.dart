import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/models/user.dart';
import 'package:two_wish/screens/boarding/boarding_page.dart';
import 'package:two_wish/screens/home_page.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser>(context);

    // return either home or authenticate
    if (user != null) {
      return HomePage();
    } else {
      return BoardingPage();
    }
  }
}
