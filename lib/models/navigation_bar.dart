import 'package:flutter/material.dart';
import 'package:flut_job/utils/uidata.dart';
import 'package:flut_job/ui/pages/testpage.dart';

class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Drawer(
    
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Deepak Prakash"),
            accountEmail: new Text("Deepakprakash2811@gmail.com"),

          ),
          new ListTile(
            title: new Text("Jobs Assigned"),
            onTap: ()=> Navigator.popAndPushNamed(context, "/")
          ),
          new ListTile(
            title: new Text("Test 2 "),
            onTap: () => Navigator.pushNamed(context, UIData.homeRoute)
            ),
          
          new Divider(),
          new ListTile(
            title: new Text("Test 3"),
          )
        ],

      ),
    );
  }
}
