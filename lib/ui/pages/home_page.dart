import 'package:flut_job/models/navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: new Container(
       child: new Center(
          child: new RaisedButton(
            onPressed: () => debugPrint("i m pressed"),
          ),
       ),
     ), 
    );
  }
}