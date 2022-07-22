import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:flutter/material.dart';
import '../components/bottom_button.dart';
import 'input_page.dart';
class Results extends StatelessWidget {
  Results({this.bmiResult,this.getResult,this.interpretation});
final String bmiResult;
final String getResult;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child:Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text('Your Result',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
                ),

              )

          ),
          Expanded(
            flex: 5,
              child:reusableCard(
                colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          getResult,
                          style: ktitle,
                        ),
                        Text(bmiResult,
                        style: kResult,
                        ),
                        Text(interpretation,
                        style: kStatement,
                          textAlign:TextAlign.center,
                        )
                      ],
                ),
              )
          ),
            bottom_button(
                onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context){
    return InputPage();
    })
    );
    }, title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
