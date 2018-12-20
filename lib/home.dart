import 'package:flut_job/models/navigation_bar.dart';
import 'package:flut_job/ui/pages/dashboard/dashboard.dart';
import 'package:flut_job/ui/pages/home_page.dart';
import 'package:flut_job/ui/pages/testpage.dart';
import 'package:flut_job/utils/uidata.dart';
import 'package:flutter/material.dart';


class home extends StatelessWidget {

final materialApp = MaterialApp(

  debugShowCheckedModeBanner: false,  // Title
      title: "FlutJob",
      initialRoute: "/",
      routes: <String,WidgetBuilder>{
        UIData.homeRoute:(BuildContext context) => new newpagee(),
        UIData.dashboardRoute:(BuildContext context) => new dashboard(),
      },

      // Home
      home: new Scaffold(
        // Appbar
        drawer: new NavBar(),
        appBar: new AppBar(
          // Title
          title: new Text("Home"),
        ),
        // Body
        body: new HomePage()

      ));
  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
