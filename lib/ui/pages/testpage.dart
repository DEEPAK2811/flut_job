import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:flut_job/models/joblistmodel.dart';
import 'package:flut_job/ui/pages/jobs/jobcard.dart';

class CrudSample extends StatefulWidget {
  @override
  CrudSampleState createState() {
    return new CrudSampleState();
  }
}

class CrudSampleState extends State<CrudSample> {
  String myText;
  StreamSubscription<DocumentSnapshot> subscription;

  final DocumentReference documentReference =
      Firestore.instance.document("myData/dummy");

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("User Signed out");
  }

  void _add() {
    Map<String, String> data = <String, String>{
      "name": "Deepak Prakash",
      "desc": "Flutter Developer",
      "location": "Delhi"
    };
    documentReference.setData(data).whenComplete(() {
      print("Document Added");
    }).catchError((e) => print(e));
  }

  void _delete() {
    documentReference.delete().whenComplete(() {
      print("Deleted Successfully");
      setState(() {});
    }).catchError((e) => print(e));
  }

  void _update() {
    Map<String, String> data = <String, String>{
      "name": "Deepak Prakash Updated",
      "desc": "Flutter Developer Updated",
      "location": "Delhi"
    };
    documentReference.updateData(data).whenComplete(() {
      print("Document Updated");
    }).catchError((e) => print(e));
  }

  void _fetch() {
    documentReference.get().then((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = documentReference.snapshots().listen((datasnapshot) {
      if (datasnapshot.exists) {
        setState(() {
          myText = datasnapshot.data['desc'];
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Available Jobs"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            new Row(
              
              children: <Widget>[
                background_img(context),
                new RaisedButton(
                  onPressed: _add,
                  child: new Text("Add"),
                  color: Colors.cyan,
                ),
                   new Padding(
              padding: const EdgeInsets.all(2.0),
            ),
                new RaisedButton(
                  onPressed: _update,
                  child: new Text("Update"),
                  color: Colors.lightBlue,
                ),
                   new Padding(
              padding: const EdgeInsets.all(2.0),
            ),
                new RaisedButton(
                  onPressed: _delete,
                  child: new Text("Delete"),
                  color: Colors.orange,
                ),
                 new Padding(
              padding: const EdgeInsets.all(2.0),
            ),
                new RaisedButton(
                  onPressed: _fetch,
                  child: new Text("Fetch"),
                  color: Colors.lime,
                ),
              ],
            ),
            /* new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            myText == null
                ? new Container()
                : new Text(
                    myText,
                    style: new TextStyle(fontSize: 20.0),
                  ),
            new Padding(
              padding: const EdgeInsets.all(10.0),
            ),*/
            Expanded(child: 
            SizedBox(
              height: 400.0, 
              child: st(),
              
              ),
              
              ),
          ],
        ),
      ),
    );
  }

  Widget st() => new StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("myData").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Center(child: new CircularProgressIndicator());
            default:
              var documents = snapshot.data?.documents ?? [];
              var docs = documents
                  .map((snapshot) => JoblistModel.from(snapshot))
                  .toList();
              return JobPage(docs);
          }
        },
      );

      Widget background_img(BuildContext context) => DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      );
}

/*getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
  return snapshot.data.documents
      .map((doc) => new ListTile(
          title: new Text(doc["name"]),
          subtitle: new Text(doc["desc"].toString())
          ))
      .toList();
}  */

class JobPage extends StatefulWidget {
  final List<JoblistModel> allJobs;

  JobPage(this.allJobs);

  @override
  State<StatefulWidget> createState() {
    return JobPageState();
  }
}

class JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    //  var filteredBaby = widget.allFish.where((BabyData data) {
    //    data.name = 'Dana';
    //  }).toList();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              background_img(context),
              ListView.builder(
                  itemCount: widget.allJobs.length,
                  padding: const EdgeInsets.only(top: 30.0),
                  itemBuilder: (context, index) {
                    return JobCard(widget.allJobs[index]);
                  }),
            ],
          ),
        )));
  }

  Widget background_img(BuildContext context) => DecoratedBox(
        decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
      );
}
