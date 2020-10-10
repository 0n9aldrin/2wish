import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/components/organisation_card.dart';
import 'package:two_wish/models/organisation.dart';

import '../components/drawer.dart';

class OrganisationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final organisations = Provider.of<List<Organisation>>(context) ?? [];

    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(
          context: context,
        ),
        appBar: AppBar(
          title: Text("Organisations"),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(organisations.length, (index) {
              return OrganisationCard(
                name: organisations[index].name,
                image: organisations[index].images[0],
                description: organisations[index].description,
                location: organisations[index].location,
              );
            }),
          ),
        ),
      ),
    );
  }
}
