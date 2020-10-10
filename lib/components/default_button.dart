import 'package:flutter/material.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  final Function function;
  final String text;
  final Color colour;

  DefaultButton({Key key, this.function, this.text, this.colour});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: colour,
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
            fontSize: getProportionateScreenWidth(18), color: Colors.white),
      ),
    );
  }
}
