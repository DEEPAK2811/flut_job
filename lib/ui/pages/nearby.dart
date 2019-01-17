import 'package:flutter/material.dart';

class nearby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.network(
        "http://www.gelib.com/Screenshots/demis1.jpg",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
