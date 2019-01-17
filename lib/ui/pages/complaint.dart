import 'package:flutter/material.dart';

class complaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Image.network(
        "https://www.durham.police.uk/About-Us/Our-commitment-to-you/PublishingImages/complaint-box-1200xx1500-844-0-81.jpg",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}

