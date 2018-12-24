import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'menu_row.dart';
import 'package:flut_job/ui/widgets/profile_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                          ? Icons.arrow_back
                          : Icons.arrow_back_ios,
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

  Widget actionMenuCard() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Card(
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.edit,
                    firstLabel: "CreateJobs",
                    firstIconCircleColor: Colors.blue,
                    
                    secondIcon: FontAwesomeIcons.opencart,
                    secondLabel: "Available",
                    secondIconCircleColor: Colors.orange,
                    thirdIcon: FontAwesomeIcons.mapMarkerAlt,
                    thirdLabel: "Nearby",
                    thirdIconCircleColor: Colors.purple,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.solidStickyNote,
                    firstLabel: "Complaints",
                    firstIconCircleColor: Colors.cyan,
                    secondIcon: FontAwesomeIcons.clock,
                    secondLabel: "Shifts",
                    secondIconCircleColor: Colors.redAccent,
                    thirdIcon: FontAwesomeIcons.userFriends,
                    thirdLabel: "GroupTask",
                    thirdIconCircleColor: Colors.pink,
                  ),
                  DashboardMenuRow(
                    firstIcon: FontAwesomeIcons.solidHeart,
                    firstLabel: "Saved Jobs",
                    firstIconCircleColor: Colors.red,
                    secondIcon: FontAwesomeIcons.store,
                    secondLabel: "Assets",
                    secondIconCircleColor: Colors.teal,
                    thirdIcon: FontAwesomeIcons.solidNewspaper,
                    thirdLabel: "Documents",
                    thirdIconCircleColor: Colors.lime,
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
            actionMenuCard(),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background_img(context),
          allCards(context),
        ],
      ),
    );
  }
}
