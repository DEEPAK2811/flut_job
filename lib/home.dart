import 'package:flut_job/models/navigation_bar.dart';
import 'package:flut_job/ui/pages/dashboard/dashboard.dart';
import 'package:flutter/material.dart';


class home extends StatelessWidget {

final materialApp = MaterialApp(

  debugShowCheckedModeBanner: false,  // Title
      title: "FlutJob",
      /*initialRoute: "/",
      routes: <String,WidgetBuilder>{
        UIData.homeRoute:(BuildContext context) => new CrudSample(),
        UIData.dashboardRoute:(BuildContext context) => new Dashboard(),
        UIData.loginRoute:(BuildContext context) => new HomePage(),
        UIData.createJobRoute:(BuildContext context) => new createjob(),
  

      },*/

      // Home
      home: new Scaffold(
        // Appbar
        drawer: new NavBar(),
        
        // Body
        body: new Dashboard()

      ));
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
