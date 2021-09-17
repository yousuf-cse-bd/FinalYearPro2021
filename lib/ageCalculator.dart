import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
// import 'package:toast/toast.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  int birthDay, birthMonth, birthYear;
  String days = "";
  String months = "";
  String years = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: Text("AGE CALCULATOR"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15.0, left: 22.0,right: 12.0, bottom: 50.0),
              child: Text(
                "If you are over 40 years of age, you should be examined by MRI...",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.red),
              ),
            ),
            // ignore: deprecated_member_use
            OutlineButton(
              child: Text(
                "Select Your Birthday",
                style: TextStyle(fontSize: 25.0, color: Colors.green[800]),
              ),
              borderSide: BorderSide(color: Colors.blue, width: 5.0,),
              // color: Colors.blue,
              onPressed: () {
                // print('Pressed');
                ageCalculator();
              },
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Your Current Age Now: " + years + ", " + months + ", " + days,
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future ageCalculator() async {
    DateTime dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now());
    setState(() {
      birthDay = int.parse(DateFormat("dd").format(dateTime));
      birthMonth = int.parse(DateFormat("MM").format(dateTime));
      birthYear = int.parse(DateFormat("yyyy").format(dateTime));
      // print('Birth year: $birthYear');

      int currentYear = int.parse(DateFormat("yyyy").format(DateTime.now()));
      int currentMonth = int.parse(DateFormat("MM").format(DateTime.now()));
      int currentDay = int.parse(DateFormat("dd").format(DateTime.now()));
      // print('current yy:$currentYear');
      int findDays = findDay(currentMonth, currentYear);

      if (birthDay > currentDay) {
        currentDay = currentDay + findDays;
        currentMonth--;
      }
      if (birthMonth > currentMonth) {
        currentMonth = currentMonth + 12;
        currentYear--;
      }
      days = (currentDay - birthDay).toString() + " days.";
      months = (currentMonth - birthMonth).toString() + " months";
      years = (currentYear - birthYear).toString() + " years";
    });
  }

  //find day and check lea year
  int findDay(int mm, int yy) {
    int findDays;
    if (mm == 1 ||
        mm == 3 ||
        mm == 5 ||
        mm == 7 ||
        mm == 8 ||
        mm == 10 ||
        mm == 12)
      findDays = 31;
    else if (mm == 4 || mm == 6 || mm == 9 || mm == 11)
      findDays = 30;
    else {
      if (yy % 4 == 0 || yy % 400 == 0)
        findDays = 29;
      else
        findDays = 28;
    }
    return findDays;
  }
}
