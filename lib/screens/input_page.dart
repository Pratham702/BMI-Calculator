import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusableCard.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import '../constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum genderType{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType selectedGender;
  int height=180;
  int weight=50;
  int Age=30;
// Color maleColor=inactiveBoxColor;
// Color femaleColor=inactiveBoxColor;
//
// void updateColor(genderType gender){
//   if(gender==genderType.male) {
//     if (maleColor == inactiveBoxColor) {
//       maleColor = boxColor;
//       femaleColor = inactiveBoxColor;
//     } else {
//       maleColor = inactiveBoxColor;
//     }
//   }
//   if(gender==genderType.female) {
//     if (femaleColor == inactiveBoxColor) {
//       femaleColor = boxColor;
//       maleColor = inactiveBoxColor;
//     }
//     else {
//       femaleColor = inactiveBoxColor;
//     }
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children:<Widget>[
          Expanded(child: Row(
            children: [
              Expanded(child:
              GestureDetector(
                onTap: (){
                  setState((){
                    selectedGender=genderType.male;
                  });
                },
                child: reusableCard(
                  onPress: (){
                    setState((){
                      selectedGender=genderType.male;
                    });
                  },
                  colour:selectedGender==genderType.male?kBoxColor:kInactiveBoxColor,
                  cardChild: iconContent(icons: (FontAwesomeIcons.mars), texts: 'Male'),
                ),
              ),),
              Expanded(
                child:
                reusableCard(
                  onPress: (){
                    setState((){
                      selectedGender=genderType.female;
                    });
                  },
                colour: selectedGender==genderType.female?kBoxColor:kInactiveBoxColor,
                cardChild: iconContent(icons: (FontAwesomeIcons.venus),texts: 'Female'),
              ),),

            ],
          )),
          Expanded(
              child:reusableCard(
                  colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Height',
                    style: textStyle,

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style:heightOfFont,
                        ),
                        Text('cm',
                        style: textStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8e98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor:Color(0x1feb1555) ,
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius:15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                      ),
                      child: Slider(
                          value: height.toDouble(),
                         min: 120.0 ,
                          max: 230.0,
                          // activeColor:Colors.white ,
                          onChanged:(double newValue){
                        setState((){
                          height=newValue.round();
                        });
                          }


                      ),
                    )

                  ],
                ),
              ),

          ),

          Expanded(child: Row(
            children: <Widget>[
              Expanded(child:reusableCard(
                  colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                              Text(
                              'Weight',
                                style: textStyle,

                              ),
                      Text(
                        weight.toString(),
                        style: heightOfFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState((){
                                weight--;
                              });
                            },
                           ),
                          // FloatingActionButton(
                          //   backgroundColor: Color(0xff4c4f5e),
                          //   child: Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState((){
                                weight++;
                              });
                            },

                          )
                          // FloatingActionButton(
                          //   backgroundColor: Color(0xff4c4f5e),
                          //   child: Icon(
                          //     Icons.add,
                          //     color: Colors.white,
                          //   ),
                          // )
                        ],
                      ),

                    ],
                ),

              ),),
              Expanded(child:reusableCard(colour: kBoxColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Age',
                      style: textStyle,

                    ),
                    Text(
                      Age.toString(),
                      style: heightOfFont,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState((){
                              Age--;
                            });
                          },
                        ),
                        // FloatingActionButton(
                        //   backgroundColor: Color(0xff4c4f5e),
                        //   child: Icon(
                        //     Icons.add,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState((){
                              Age++;
                            });
                          },

                        )
                        // FloatingActionButton(
                        //   backgroundColor: Color(0xff4c4f5e),
                        //   child: Icon(
                        //     Icons.add,
                        //     color: Colors.white,
                        //   ),
                        // )
                      ],
                    ),

                  ],
                ),

              ),

              ),
            ],
          )),
          bottom_button(title: 'CALCULATE',
            onTap: (){
            CalculateBrain calc = CalculateBrain(height: height,weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context){
                    return Results(
                      bmiResult: calc.calculateBMI(),
                      getResult: calc.getResult(),
                      interpretation: calc.interpretation(),
                    );
                  })
              );
            },


          )
        ],

      ),

    );
  }
}





