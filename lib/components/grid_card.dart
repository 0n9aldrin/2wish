import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:two_wish/screens/details_page.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: "Shirt",
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Colors.white,
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://pyxis.nymag.com/v1/imgs/d19/fc1/0de89f03dfa39fa0ff8b1fe838532f153b-031231-04.rsquare.w600.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Shirt',
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: LinearPercentIndicator(
                  lineHeight: 14,
                  percent: 0.75,
                  center: Text(
                    "75%",
                    style: new TextStyle(fontSize: 12.0),
                  ),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  trailing: Text("23/50"),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Church',
                ),
              ),
              SizedBox(height: 8.0),
            ],
          ),
        ),
      ),
    );
  }
}
