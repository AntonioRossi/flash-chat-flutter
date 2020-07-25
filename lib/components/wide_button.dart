import 'package:flutter/material.dart';

class WideButton extends StatelessWidget {
  final String text;
  final Color color;
  final Function callBack;

  WideButton({this.text, this.color, this.callBack});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: callBack,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text),
        ),
      ),
    );
  }
}
