import 'package:flutter/material.dart';

import '../../size_config.dart';

class BoardingContent extends StatelessWidget {
  final String text, image;
  BoardingContent({Key key, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "TOKOTO",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          width: getProportionateScreenWidth(400),
          height: getProportionateScreenHeight(300),
        )
      ],
    );
  }
}
