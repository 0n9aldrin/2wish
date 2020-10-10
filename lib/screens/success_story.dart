import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/components/success_card.dart';
import 'package:two_wish/models/success.dart';

import '../components/drawer.dart';

class SuccessStory extends StatefulWidget {
  @override
  _SuccessStoryState createState() => _SuccessStoryState();
}

class _SuccessStoryState extends State<SuccessStory> {
  @override
  Widget build(BuildContext context) {
    final success = Provider.of<List<Success>>(context) ?? [];

    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(
          context: context,
        ),
        appBar: AppBar(
          title: Text("Successful donations"),
        ),
        body: Container(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(success.length, (index) {
              return SuccessCard(
                name: success[index].title,
                image: success[index].image,
                description: success[index].description,
                date: success[index].date,
                organisation: success[index].organisation,
              );
            }),
          ),
        ),
      ),
    );
  }
}
