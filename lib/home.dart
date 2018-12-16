import 'package:flutter/material.dart';

class home extends StatelessWidget {
final materialApp = MaterialApp(

  debugShowCheckedModeBanner: false,  // Title
      title: "FlutJob",
      // Home
      home: new Scaffold(
        // Appbar
        appBar: new AppBar(
          // Title
          title: new Text("Home"),
        ),
        // Body
        body: new home()
      ));
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
