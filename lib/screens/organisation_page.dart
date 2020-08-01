import 'package:flutter/material.dart';
import 'package:two_wish/components/grid_card.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/models/organisation.dart';
import 'package:two_wish/services/database.dart';

import '../drawer.dart';

class OrganisationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(
          context: context,
        ),
        appBar: AppBar(
          title: Text("Organisations"),
        ),
        body: Container(),
      ),
    );
  }
}
