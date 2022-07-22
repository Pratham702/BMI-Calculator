import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';



class iconContent extends StatelessWidget {
  iconContent({@required this.icons,@required this.texts});
  final IconData icons;
  final String texts;
  @override
  Widget build(BuildContext context) {
    return Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(icons, size: 80.0,),
        SizedBox(height: 15.0,),
        Text(texts , style: textStyle)

      ],
    );
  }
}