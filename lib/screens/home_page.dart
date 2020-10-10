import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/models/organisation.dart';
import 'package:two_wish/services/auth.dart';

import '../components/grid_card.dart';
import '../components/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> charityTabs = [];
    List<Widget> charityScrollBars = [];
    final organisations = Provider.of<List<Organisation>>(context) ?? [];
    AuthService authService = AuthService();

    for (int x = 0; x < organisations.length; x++) {
      charityScrollBars.add(
        Scrollbar(
          child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                children: List.generate(organisations[x].items.length, (index) {
                  return GridCard(
                    itemName: organisations[x].items[index]['Item'],
                    imageUrl: organisations[x].items[index]['Image URL'],
                    amountReceived: organisations[x].items[index]
                        ['Amount received'],
                    amountRequested: organisations[x].items[index]
                        ['Requested Amount'],
                  );
                }),
              )),
        ),
      );
    }

    for (int x = 0; x < organisations.length; x++) {
      charityTabs.add(
        Tab(
          text: organisations[x].name,
        ),
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: organisations.length,
        child: Scaffold(
          drawer: DrawerWidget(context: context),
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () async {
                  await authService.signOut();
                },
              ),
            ],
            title: Text("2WISH.JKT"),
            bottom: TabBar(
              tabs: charityTabs,
              isScrollable: true,
            ),
          ),
          body: TabBarView(
            children: charityScrollBars,
          ),
        ),
      ),
    );
  }
}
