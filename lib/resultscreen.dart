import 'package:bmi_calculator/constant.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
class resultscreen extends StatefulWidget {
  const resultscreen({super.key, required this.bmiresults, });
  final int bmiresults;
  @override
  State<resultscreen> createState() => _resultscreenState();
}
class _resultscreenState extends State<resultscreen> {

  var textcolor = Colors.white;
  var range = "Normal";
  var imagepath ="normal";

  @override
  @override
  void initState() {

    super.initState();
    updateUI();
  }

  void updateUI(){
    var bmi = widget.bmiresults;
    if(bmi<18){
      setState(() {
         textcolor = Colors.blue;
         range = "Underweight";
         imagepath ="underweight";
      });
    }
    else if(bmi>18 && bmi<25){
      setState(() {
        textcolor = Colors.green;
        range = "Normal";
        imagepath ="normal";
      });
    }
    else if(bmi>25 && bmi<30){
      setState(() {
        textcolor = Colors.redAccent;
        range = "Overweight";
        imagepath ="overweight";
      });
    }
    else if(bmi>30 && bmi<40){
      setState(() {
        textcolor = Colors.red;
        range = "Obese";
        imagepath ="obese";
      });
    }
    else if(bmi>40){
      setState(() {
        textcolor = Colors.purple;
        range = "Extreme";
        imagepath ="extreme";
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold( backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text("Results",style: textstyle,),
        centerTitle: true,
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Your BMI value is ", style: textstyle,),
                  Text('${widget.bmiresults}',style: numstyle,),
                  Text('${range}',style: numstyle.copyWith(color: textcolor),),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/$imagepath.png',),
          ),
          SizedBox(height: 50,),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.all(Radius.circular(8))
              ),
              child: Center(child: Text("Calculate Again", style: textstyle,)),
            ),
          ),
        ],
      ),
    );
  }
}
