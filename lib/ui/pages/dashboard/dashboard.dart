import 'package:flut_job/utils/uidata.dart';
import 'package:flut_job/models/navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flut_job/ui/widgets/profile_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flut_job/ui/widgets/label_below_icon.dart';

class Dashboard extends StatelessWidget {
  Size deviceSize;
  Widget appBarColumn(BuildContext context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 18.0),
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new IconButton(
                    icon: new Icon(
                      defaultTargetPlatform == TargetPlatform.android
                          ? Icons.menu
                          : Icons.menu,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                  ),
                  new ProfileTile(
                    title: "Hi, Deepak Prakash",
                    subtitle: "Welcome to the FlutJOB",
                    textColor: Colors.white,
                  ),
                  new IconButton(
                    icon: new Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("hi");
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      );

  Widget searchCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Find our Jobs/Services"),
                  ),
                ),
                Icon(Icons.menu),
              ],
            ),
          ),
        ),
      );

  Widget actionMenuCard(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.edit,
                            label: "CreateJobs",
                            circleColor: Colors.blue,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.createJobRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.opencart,
                            label: "Available",
                            circleColor: Colors.orange,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.mapMarkerAlt,
                            label: "Nearby",
                            circleColor: Colors.purple,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.nearbyRoute),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.solidStickyNote,
                            label: "Complaints",
                            circleColor: Colors.cyan,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.complaintRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.clock,
                            label: "Shifts",
                            circleColor: Colors.redAccent,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.userFriends,
                            label: "Group Task",
                            circleColor: Colors.pink,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.solidHeart,
                            label: "Saved Jobs",
                            circleColor: Colors.red,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.store,
                            label: "Assets",
                            circleColor: Colors.teal,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                        new InkWell(
                          child: LabelBelowIcon(
                            icon: FontAwesomeIcons.solidNewspaper,
                            label: "Documents",
                            circleColor: Colors.lime,
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, UIData.homeRoute),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget balanceCard() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Balance",
                    ),
                    Material(
                      color: Colors.black,
                      shape: StadiumBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "280 Points",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Text(
                  "₹ 9600",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.green,
                      fontSize: 25.0),
                ),
              ],
            ),
          ),
        ),
      );

  Widget allCards(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appBarColumn(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            searchCard(),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            actionMenuCard(context),
            SizedBox(
              height: deviceSize.height * 0.01,
            ),
            balanceCard(),
          ],
        ),
      );

  Widget background_img(BuildContext context) => DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      );

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: new NavBar(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background_img(context),
          allCards(context),
        ],
      ),
    );
  }

  /* act(int i) {
    BuildContext context;
                      switch(i){
                        case 1:Navigator.pushNamed(context, UIData.homeRoute);
                        break;
                      
  }}*/

}
