import 'package:flutter/material.dart';
import 'package:two_wish/components/default_button.dart';
import 'package:two_wish/constants.dart';
import 'package:two_wish/size_config.dart';

import 'boarding_content.dart';

class BoardingPage extends StatefulWidget {
  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  int currentPage = 0;
  List<Map<String, String>> boardingData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/5299.png"
    },
    {
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/54474.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/4126721.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: boardingData.length,
                    itemBuilder: (context, index) => BoardingContent(
                      text: boardingData[index]["text"],
                      image: boardingData[index]["image"],
                    ),
                  )),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Row(
                        children: List.generate(
                          boardingData.length,
                          (index) => buildDot(index: index),
                        ),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(56),
                        child: DefaultButton(
                          text: "Sign In",
                          function: () {
                            Navigator.pushNamed(context, '/sign_in');
                          },
                          colour: Colors.orange,
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        width: double.infinity,
                        height: getProportionateScreenHeight(56),
                        child: DefaultButton(
                          text: "Sign Up",
                          function: () {
                            Navigator.pushNamed(context, '/sign_up');
                          },
                          colour: kPrimaryColour,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColour : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
