import 'package:bmi_app/constants/app_constants.dart';
import 'package:bmi_app/widgets/left_bar.dart';
import 'package:bmi_app/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  //const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI calculator - v.1.8",
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w400),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                          color: accentHexColor),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Height",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)),
                      )),
                ),
                Container(
                  width: 130,
                  child: TextField(
                      controller: _weightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w500,
                          color: accentHexColor),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Weight",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8)),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = (_w * 10000) / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "you\'re over weight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "you have normal weight";
                  } else {
                    _textResult = "you\'re under weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(1),
                style: TextStyle(fontSize: 90, color: accentHexColor),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      color: accentHexColor,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 40,
            ),
            RightBar(
              barWidth: 50,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 30,
            ),
            SizedBox(
              height: 20,
            ),
            RightBar(
              barWidth: 50,
            ),
          ],
        ),
      ),
    );
  }
}
