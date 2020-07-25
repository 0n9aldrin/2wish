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
    List<Widget> charityTabs = [
      Tab(
        text: "Charity 1",
      ),
      Tab(
        text: "Charity 2",
      ),
      Tab(
        text: "Charity 3",
      ),
      Tab(
        text: "Charity 4",
      ),
      Tab(
        text: "Charity 5",
      ),
    ];
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
            children: <Widget>[
              Scrollbar(
                child: Container(
                  child: Text("Charity 1"),
                ),
              ),
              Scrollbar(
                child: Container(
                  child: Text("Charity 2"),
                ),
              ),
              Scrollbar(
                child: Container(
                  child: Text("Charity 3"),
                ),
              ),
              Scrollbar(
                child: Container(
                  child: Text("Charity 4"),
                ),
              ),
              Scrollbar(
                child: Container(
                  child: Text("Charity 5"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
