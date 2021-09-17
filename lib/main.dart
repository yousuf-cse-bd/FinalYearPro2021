import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:patienaid/homeScreen.dart';
import 'package:patienaid/loginscreen.dart';
import 'package:patienaid/mainscreen.dart';
import 'package:patienaid/registerScreen.dart';
import 'package:provider/provider.dart';

import 'appData.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MyApp());
}

///Declare Database
DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("""users""");

class MyApp extends StatelessWidget {
  //This widget is the root of my application
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();
    return ChangeNotifierProvider(
      create: (context)=>AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Patient Aid App",
        theme: ThemeData(
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: MainScreen(),
        initialRoute: HomeScreen.idScreen,
        routes: {
          HomeScreen.idScreen: (context) => HomeScreen(),
          RegisterScreen.idScreen: (context) => RegisterScreen(),
          LoginScreen.idScreen: (context) => LoginScreen(),
          MainScreen.idScreen: (context) => MainScreen(),
        },
        home: RegisterScreen(),
      ),
    );
  }
}
