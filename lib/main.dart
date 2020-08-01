import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/models/organisation.dart';
import 'package:two_wish/screens/home_page.dart';
import 'package:two_wish/screens/organisation_page.dart';
import 'package:two_wish/screens/second_page.dart';
import 'package:two_wish/services/database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Organisation>>.value(
      value: DatabaseService().organisations,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/second': (context) => SecondPage(),
          '/organisation': (context) => OrganisationPage(),
        },
      ),
    );
  }
}
