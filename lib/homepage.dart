import 'package:bmi_calculator/resultscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constant.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}




class _HomepageState extends State<Homepage> {
  int heightslider =120;
  int age = 10;
  int weight = 30;
  Color maleColour = Color(0xff033e66);
  Color femaleColour = Color(0xff033e66);

  void genderselect(bool gender){
    if(gender){
      setState(() {
        maleColour = blueColor;
        femaleColour= selectedColor;
      });
    }
    else{
     setState(() {
       maleColour = selectedColor;
       femaleColour= blueColor;
     });
    }
  }

  addSubAge(bool addAge){
    if(addAge){
      setState(() {
        age++;
      });
    }
    else{
      age--;
    }

  }

  addSubWeight(bool addWeight){
    if(addWeight){
      setState(() {
        weight++;
      });
    }
    else{
      setState(() {
        weight--;
      });
    }
  }

  void results(){
    var height= heightslider/100;
    var weights= weight;
    var bmiresults = weights / (height*height);
    setState(() {
      print(bmiresults.round());
      Navigator.push(context, MaterialPageRoute(builder: (context)=>resultscreen(bmiresults:bmiresults.round(),)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: backgroundColor,
        title: Center(
          child: Text('BMI Calculator', style: TextStyle(
          fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        color: backgroundColor,
        child:
        //Column 1
        Column(
          children: [
            SizedBox(
              height: 40,
            ),
            //row 1
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      genderselect(true);
                    });
                  },
                  child: Reusablecard(Colour: maleColour, Cardchild: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: FaIcon(FontAwesomeIcons.mars,size: 80,color: Colors.white,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("Male",style: textstyle),
                    )
                  ],
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      genderselect(false);
                    });
                  },
                  child: Reusablecard(Colour: femaleColour,Cardchild: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: FaIcon(FontAwesomeIcons.venus,size: 80,color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("Female",style: textstyle,),
                      )
                    ],
                  ),
                  ),
                ),
              ],
            ),
          SizedBox(height: 40,),
            //row 2
            Container(
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: MediaQuery.of(context).size.width,
             
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Height", style: textstyle,),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${heightslider}',style: numstyle,),
                      SizedBox(width: 10,),
                      Text("cm", style: numstyle,),

                    ],
                  ),
                  Slider(
                    min: 120,
                    max: 200,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    thumbColor: Colors.pink,
                    value: heightslider.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        heightslider = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Reusablecard(Colour: blueColor,Cardchild: Column(
                children: [
                  Text("Age", style: textstyle,),
                  Text('${age}',style: numstyle,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Roundbutton(iconss: FontAwesomeIcons.minus,
                          onPressed: (){
                          setState(() {
                            addSubAge(false);
                          });
                          },),
                        Roundbutton(iconss: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              addSubAge(true);
                            });
                          },),
                      ],
                    ),
                  ),

                ],  
                ),
                ),
                Reusablecard(Colour: blueColor,Cardchild: Column(
                  children: [
                    Text("Weight", style: textstyle,),
                    Text('${weight}',style: numstyle,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Roundbutton(iconss: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                addSubWeight(false);
                              });
                            },),
                          Roundbutton(iconss: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                addSubWeight(true);

                              });
                            },),
                        ],
                      ),
                    ),

                  ],
                ),),
              ],
            ),
            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                results();

              },
              child: Container(
                child: Center(child: Text("Calculate BMI", style: textstyle,)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink
                ),
                height: 70,
                width: MediaQuery.of(context).size.width,

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reusablecard extends StatelessWidget {
  Reusablecard({required this.Colour, required this.Cardchild});

  Color Colour;
  final Widget Cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colour,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 200,
      width: 200,
      child: Cardchild,
    );
  }
}

class Roundbutton extends StatelessWidget {
   Roundbutton({super.key, required this.iconss, required this.onPressed});


  final IconData iconss;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onPressed,
      child: Icon(iconss),
      constraints : BoxConstraints(minWidth: 88.0, minHeight: 46.0),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );

  }
}
