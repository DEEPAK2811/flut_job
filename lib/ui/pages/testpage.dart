import 'package:flut_job/models/navigation_bar.dart';
import 'package:flutter/material.dart';

class newpagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("New Page"),
      ),
      body: Container(
      child: Center(
          child: new Text("this is the new screen"),
        ),
        
      ),
      drawer: new NavBar(),
    );
  }
}