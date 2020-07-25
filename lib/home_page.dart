import 'package:flutter/material.dart';

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
            child: Text("Charity $x"),
          ),
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
