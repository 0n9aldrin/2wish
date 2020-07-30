import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:two_wish/services/database.dart';

class DetailsPage extends StatefulWidget {
  final String title;

  DetailsPage({this.title});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double rating = 5;
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    print(deviceHeight);
    print(deviceWidth);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://pyxis.nymag.com/v1/imgs/d19/fc1/0de89f03dfa39fa0ff8b1fe838532f153b-031231-04.rsquare.w600.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: LinearPercentIndicator(
                    lineHeight: 20,
                    percent: 0.75,
                    center: Text(
                      "75%",
                      style: new TextStyle(fontSize: 12.0),
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    trailing: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("23/50"),
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Notes",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: myController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Notes",
                        fillColor: Colors.white70),
                  ),
                ),
                SizedBox(height: 8.0),
                Slider(
                  min: 0,
                  max: 23,
                  inactiveColor: Colors.blue,
                  activeColor: Colors.blue,
                  value: rating,
                  onChanged: (newRating) {
                    setState(() {
                      rating = newRating;
                    });
                  },
                  divisions: 23,
                  label: "${rating.round()}",
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        DatabaseService databaseService = DatabaseService();
                        int requestsLength =
                            await databaseService.getRequestsLength();
                        databaseService.updateRequestsData(
                            documentID: (requestsLength + 1).toString(),
                            phoneNumber: '+6281284538316',
                            itemId: '00001',
                            donationAmount: rating.round(),
                            note: myController.text);
                        databaseService.updateRequestNumber(
                            requestNumber: requestsLength + 1);
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.favorite),
                      label: Text("Donate"),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
