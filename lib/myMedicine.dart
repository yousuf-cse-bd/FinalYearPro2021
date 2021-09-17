import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyMedicine extends StatefulWidget {
  @override
  _MyMedicineState createState() => _MyMedicineState();
}

class _MyMedicineState extends State<MyMedicine> {
  bool isOn = false;
  int alarmID = 1;
  var dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text(
            "MY MEDICINE",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Text(
            //     "Alarm Fired at:$dateTime",
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 30.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Transform.scale(
              scale: 2,
              child: Switch(
                value: isOn,
                onChanged: (value) {
                  setState(() {
                    isOn = value;
                  });
                  if (isOn == true) {
                    AndroidAlarmManager.periodic(
                        Duration(seconds: 20), alarmID, alarmTrigger);
                  } else {
                    AndroidAlarmManager.cancel(alarmID);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
void alarmTrigger() {
  print('Alarm Fired at ${DateTime.now()}');
  Fluttertoast.showToast(
      msg: "Alarm Fired at ${DateTime.now()}",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white);
}
