import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/constants.dart';
import 'package:two_wish/models/user.dart';
import 'package:two_wish/screens/boarding/boarding_page.dart';
import 'package:two_wish/screens/home_page.dart';
import 'package:two_wish/screens/organisation_page.dart';
import 'package:two_wish/screens/second_page.dart';
import 'package:two_wish/screens/authenticate/sign_up.dart';
import 'package:two_wish/screens/success_story.dart';
import 'package:two_wish/screens/wrapper.dart';
import 'package:two_wish/services/auth.dart';
import 'package:two_wish/services/database.dart';

import 'models/organisation.dart';
import 'models/success.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<CustomUser>.value(
          value: AuthService().user,
        ),
        StreamProvider<List<Organisation>>.value(
          value: DatabaseService().organisations,
        ),
        StreamProvider<List<Success>>.value(
          value: DatabaseService().success,
        ),
      ],
      child: MaterialApp(
        title: '2wish',
        theme: ThemeData(
          fontFamily: "Muli",
          appBarTheme: AppBarTheme(
            color: kPrimaryColour,
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.white),
          ),
          primarySwatch: kPrimaryColour,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/wrapper',
        routes: {
          '/': (context) => HomePage(),
          '/wrapper': (context) => Wrapper(),
          '/boarding': (context) => BoardingPage(),
          '/second': (context) => SecondPage(),
          '/organisation': (context) => OrganisationPage(),
          '/success': (context) => SuccessStory(),
          '/sign_up': (context) => SignInByPhone(),
        },
      ),
    );
  }
}
