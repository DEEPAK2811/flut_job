import 'package:flutter/material.dart';
import 'home.dart';


void main() {
  
  runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,  // Title
      title: "FirstPage",
      // Home
      home: new Scaffold(
        // Appbar
        appBar: new AppBar(
          // Title
          title: new Text("FlutJob"),
        ),
        // Body
        body: new home()
      )));
}
