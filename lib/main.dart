import 'package:flutter/material.dart';

import './screens/main_screen.dart';
import './screens/description_screen.dart';
import './screens/ouput_screen.dart';
import './screens/demo_speech.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.blue,
      ),
      home: DemoSpeech(),
      routes: {
        MainScreen.routeName : (ctx) => MainScreen(),
        OutputScreen.routeName: (ctx) => OutputScreen(),
        DescriptionScreen.routeName: (ctx) => DescriptionScreen(),
      },
    );
  }
}
