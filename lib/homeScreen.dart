import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:patienaid/ageCalculator.dart';
import 'package:patienaid/loginscreen.dart';
import 'package:patienaid/mainscreen.dart';
import 'package:patienaid/myMedicine.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  static const String idScreen = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Patient Aid",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.all(10.0),
            // padding: const EdgeInsets.only(
            //     left: 50.0, top: 100.0, right: 100.0, bottom: 100.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100.0,
                  ),
                  Ink(
                    color: Colors.blue,
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyMedicine()));
                        },
                        icon: Icon(
                          Icons.alarm,
                          size: 40.0,
                        ),
                        label: Text(
                          "My Medicine",
                          style: TextStyle(fontSize: 30.0),
                        )),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Ink(
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AgeCalculator()));
                        },
                        icon: Icon(
                          Icons.calendar_today,
                          size: 40.0,
                        ),
                        label: Text(
                          "Age Calculator",
                          style: TextStyle(fontSize: 30.0),
                        )),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Ink(
                    // color: Colors.blue,
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalculatorIBW()));
                        },
                        icon: Icon(
                          Icons.add_alert,
                          color: Colors.red[600],
                          size: 40.0,
                        ),
                        label: Text(
                          "IBW Calculator",
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.red[600]),
                        )),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Ink(
                    // color: Colors.blue,
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: () {
                          //Called BMI Calculator
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CalculatorBMI()));
                        },
                        icon: Icon(
                          Icons.wc,
                          color: Colors.red[900],
                          size: 40.0,
                        ),
                        label: Text(
                          "BMI Calculator",
                          style:
                              TextStyle(fontSize: 30.0, color: Colors.red[900]),
                        )),
                  ),
                  Ink(
                    color: Colors.blue,
                    // ignore: deprecated_member_use
                    child: FlatButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      FirebaseAuth.instance.currentUser == null
                                          ? LoginScreen()
                                          : MainScreen()));
                        },
                        icon: Icon(
                          Icons.directions_car,
                          size: 40.0,
                          color: Colors.redAccent,
                        ),
                        label: Text(
                          "My Ambulance",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.redAccent,
                          ),
                        )),
                  ),
                ])),
        // ignore: deprecated_member_use
      ),
    );
  }
}

//For IBW Calculator
class CalculatorIBW extends StatefulWidget {
  @override
  _CalculatorIBWState createState() => _CalculatorIBWState();
}

class _CalculatorIBWState extends State<CalculatorIBW> {
  TextEditingController heightCon = TextEditingController();
  var height;
  var ibw = 0.0;
  dynamic ibwMethod() {
    height = heightCon.text;
    height = double.parse(height);
    // height = height * 0.3048;
    setState(() {
      ibw = (52.3 * height) / 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Center(
          child: Text(
            "IBW Calculator",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  "Enter Your Height Below:",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: heightCon,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    labelText: "Height in Feet: ",
                    labelStyle: TextStyle(fontSize: 25.0, color: Colors.blue),
                    hintText: "5.4",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Ink(
                  // ignore: deprecated_member_use
                  child: FlatButton.icon(
                    onPressed: () {
                      if (heightCon.text.isEmpty) {
                        Toast.show("Please Enter Your Height Value...", context,
                            duration: Toast.LENGTH_LONG);
                      } else if (heightCon.text.contains(":") ||
                          heightCon.text.contains("%") ||
                          heightCon.text.contains("+") ||
                          heightCon.text.contains("-") ||
                          heightCon.text.contains("*") ||
                          heightCon.text.contains("/") ||
                          heightCon.text.contains(" ")) {
                        Toast.show("Please Enter Valid Value...", context,
                            duration: Toast.LENGTH_LONG);
                      } else {
                        //Call method
                        ibwMethod();
                      }
                    },
                    icon: Icon(
                      Icons.calculate,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    label: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Your Standard Weight: " + ibw.toStringAsFixed(2) + " KGs",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//For BMI calculator
class CalculatorBMI extends StatefulWidget {
  @override
  _CalculatorBMIState createState() => _CalculatorBMIState();
}

class _CalculatorBMIState extends State<CalculatorBMI> {
  TextEditingController height = TextEditingController();
  TextEditingController weight = TextEditingController();
  var _height, _weight;
  var bmi = 0.0;
  bmiMethod() {
    _height = height.text;
    _weight = weight.text;

    _height = double.parse(_height);
    _weight = double.parse(_weight);
    _height = _height * 0.3048; //feet to metre
    setState(() {
      bmi = _weight / (_height * _height);
      // print('Your BMI: '+bmi.toString());
      if (bmi <= 18.5) {
        Toast.show("Your BMI Value Weightless..!", context,
            duration: Toast.LENGTH_LONG);
      } else if (bmi >= 18.6 && bmi <= 24.99) {
        Toast.show("Your BMI Value Normal.", context,
            duration: Toast.LENGTH_LONG);
      } else if (bmi >= 25.0 && bmi <= 29.99) {
        Toast.show("You Have Extra Weight..!", context,
            duration: Toast.LENGTH_LONG);
      } else if (bmi >= 30) {
        Toast.show("You Have Vulgar Weight..!", context,
            duration: Toast.LENGTH_LONG);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  "Weightless: 18.5",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Normal Weight: 18.5-24.0",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Extra Weight: 25.0-29.0",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Vulgar Weight: 30.0-40.0",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Your BMI: " + bmi.toStringAsFixed(3),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: height,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    labelText: "Height in Feet: ",
                    labelStyle: TextStyle(fontSize: 25.0, color: Colors.blue),
                    hintText: "5.4",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: weight,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                    labelText: "Weight in KGs: ",
                    labelStyle: TextStyle(fontSize: 25.0, color: Colors.blue),
                    hintText: "63.0",
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Ink(
                  // ignore: deprecated_member_use
                  child: FlatButton.icon(
                    onPressed: () {
                      if (weight.text.isEmpty || height.text.isEmpty) {
                        Toast.show("Please Enter Your Value", context,
                            duration: Toast.LENGTH_LONG);
                      } else if (height.text.contains(":") ||
                          height.text.contains("%") ||
                          height.text.contains("+") ||
                          height.text.contains("-") ||
                          height.text.contains("*") ||
                          height.text.contains("/") ||
                          height.text.contains(" ")) {
                        Toast.show("Please Enter Valid Value...", context,
                            duration: Toast.LENGTH_LONG);
                      } else if (height.text.contains(":") ||
                          weight.text.contains("%") ||
                          weight.text.contains("+") ||
                          weight.text.contains("-") ||
                          weight.text.contains("*") ||
                          weight.text.contains("/") ||
                          weight.text.contains(" ")) {
                        Toast.show("Please Enter Valid Value...", context,
                            duration: Toast.LENGTH_LONG);
                      } else {
                        //call bmi method/ operation
                        bmiMethod();
                      }
                    },
                    icon: Icon(
                      Icons.calculate,
                      color: Colors.blue,
                      size: 50.0,
                    ),
                    label: Text(
                      "Calculate",
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
