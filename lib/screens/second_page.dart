import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:two_wish/components/grid_card.dart';
import 'package:two_wish/components/drawer.dart';
import 'package:two_wish/models/organisation.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final organisations = Provider.of<List<Organisation>>(context) ?? [];
    List<dynamic> itemList = [];
    if (organisations.length > 0) {
      for (Organisation index in organisations) {
        for (dynamic x in index.items) {
          itemList.add(x);
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget(context: context),
        appBar: AppBar(
          title: Text("Second Page"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red[300], width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                ),
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(itemList.length, (index) {
                      return GridCard(
                        itemName: itemList[index]['Item'],
                        imageUrl: itemList[index]['Image URL'],
                        amountRequested: itemList[index]['Requested Amount'],
                        amountReceived: itemList[index]['Amount received'],
                      );
                    }),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
