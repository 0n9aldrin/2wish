import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DetailsPage extends StatefulWidget {
  final String title;

  DetailsPage({this.title});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  double rating = 5;
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
                      onPressed: null,
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
