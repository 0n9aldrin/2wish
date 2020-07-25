import 'package:flutter/material.dart';

import 'drawer.dart';

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

    for (int x = 0; x < 5; x++) {
      charityScrollBars.add(
        Scrollbar(
          child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(50, (index) {
                  return Container(
                    padding: EdgeInsets.all(5.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      color: Colors.blue,
                    ),
                  );
                }),
              )),
        ),
      );
    }

    for (int x = 0; x < 5; x++) {
      charityTabs.add(
        Tab(
          text: "Charity $x",
        ),
      );
    }

    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          drawer: drawer,
          appBar: AppBar(
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
