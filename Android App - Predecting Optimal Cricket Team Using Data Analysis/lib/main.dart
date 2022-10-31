import 'package:edi2/all_matches.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EDI Project',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      theme: new ThemeData(primaryColor: Color.fromRGBO(58, 66, 86, 1.0)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: MatchesHomePage(),
    // );
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: MatchesHomePage(),
      image: Image.asset('assets/crick.gif'),
      loadingText: Text("opening......."),
      title: Text(
        "edi project",
        style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontFamily: 'Open Sans',
            fontSize: 40),
      ),
      photoSize: 100,
    );
  }
}
