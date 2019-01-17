import 'package:flutter/material.dart';
import 'package:flut_job/utils/uidata.dart';
import 'package:flut_job/ui/pages/testpage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class NavBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return new Drawer(
    
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text("Deepak Prakash",style:TextStyle(color: Colors.white),),
            accountEmail: new Text("Deepakprakash2811@gmail.com",style:TextStyle(color: Colors.white),),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: AssetImage("assets/ag.jpg"),
              radius: 40,
            ),
             decoration: BoxDecoration(image: new DecorationImage(
               image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover
             )),
          ),

          new ListTile(
            title: new Text("Home "),
            onTap: () => Navigator.pushNamed(context, UIData.dashboardRoute)
            ),
          new ListTile(
            title: new Text("Jobs Assigned"),
            onTap: () => Navigator.pushNamed(context, UIData.assignJobRoute)
          ),
          
          new Divider(indent: 10.0,),
          new ListTile(
            title: new Text("Sign Out"),
           
          )
        ],

      ),
    );
  }
}
