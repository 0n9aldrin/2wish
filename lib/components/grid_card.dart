import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:two_wish/screens/details_page.dart';

class GridCard extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final int amountReceived;
  final int amountRequested;

  GridCard(
      {this.imageUrl,
      this.itemName,
      this.amountReceived,
      this.amountRequested});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(
              title: itemName,
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
                        image: NetworkImage(imageUrl), fit: BoxFit.fill),
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  itemName,
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: LinearPercentIndicator(
                  lineHeight: 14,
                  percent: (amountReceived / amountRequested),
                  center: Text(
                    "${((amountReceived / amountRequested) * 100).round()}%",
                    style: new TextStyle(fontSize: 12.0),
                  ),
                  backgroundColor: Colors.grey,
                  progressColor: Colors.blue,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  trailing: Text("$amountReceived/$amountRequested"),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Orphanage',
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
