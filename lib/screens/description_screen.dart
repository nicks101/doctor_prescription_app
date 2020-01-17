import "package:flutter/material.dart";

import './main_screen.dart';

class DescriptionScreen extends StatelessWidget {
  static const routeName = '/description-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Get Started'),
          color : Theme.of(context).primaryColor,
          textColor: Colors.white,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          splashColor: Theme.of(context).accentColor,
          onPressed: () {
            Navigator.of(context).pushNamed(MainScreen.routeName);
          },
        ),
      ),
    );
  }
}
