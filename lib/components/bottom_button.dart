import 'package:flutter/material.dart';
import '../constants.dart';
class bottom_button extends StatelessWidget {
  bottom_button({@required this.onTap,@required this.title});
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColor ,
        padding: EdgeInsets.only(bottom: 10.0),
        margin: EdgeInsets.only(top: 10.0),
        height:kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}