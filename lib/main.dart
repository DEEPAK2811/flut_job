import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flut_job/ui/pages/assignedjobs.dart';
import 'package:flut_job/ui/pages/complaint.dart';
import 'package:flut_job/ui/pages/createjob.dart';
import 'package:flut_job/ui/pages/dashboard/dashboard.dart';
import 'package:flut_job/ui/pages/home_page.dart';
import 'package:flut_job/ui/pages/nearby.dart';
import 'package:flut_job/ui/pages/testpage.dart';
import 'package:flut_job/utils/uidata.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';

// ************** Begin Auth

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

Future<FirebaseUser> signInWithGoogle() async {
  // Attempt to get the currently authenticated user
  GoogleSignInAccount currentUser = _googleSignIn.currentUser;
  if (currentUser == null) {
    // Attempt to sign in without user interaction
    currentUser = await _googleSignIn.signInSilently();
  }
  if (currentUser == null) {
    // Force the user to interactively sign in
    currentUser = await _googleSignIn.signIn();
  }
  

  final GoogleSignInAuthentication auth = await currentUser.authentication;

  // Authenticate with firebase
  final FirebaseUser user = await _auth.signInWithGoogle(
    idToken: auth.idToken,
    accessToken: auth.accessToken,
  );

  assert(user != null);
  assert(!user.isAnonymous);
  

  return user;
}

Future<Null> signOutWithGoogle() async {
  debugPrint('Signing Out');
  await _auth.signOut();
  await _googleSignIn.signOut();
}

// ************** ENd Auth

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: _handleCurrentScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new HomePage(),
        UIData.homeRoute:(BuildContext context) => new CrudSample(),
        UIData.dashboardRoute:(BuildContext context) => new Dashboard(),
        UIData.loginRoute:(BuildContext context) => new HomePage(),
        UIData.createJobRoute:(BuildContext context) => new createjob(),
        UIData.nearbyRoute:(BuildContext context) => new nearby(),
        UIData.complaintRoute:(BuildContext context) => new complaint(),
        UIData.assignJobRoute:(BuildContext context) => new jobasgn(),

  
        },
    );
  }

  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return new SplashScreen();
        } else {
          if (snapshot.hasData) {
            //return new MainScreen(firestore: firestore,uuid: snapshot.data.uid);
            return new Dashboard();
          }
          return new HomePage();
        }
      }
    );
}
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }


  @override
  void initState() {
    super.initState();
    startTime();
  }
  



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Image.asset('assets/sp.jpg'),
      ),
    );
  }
}

/*class SplashPage extends StatefulWidget {
  @override
  State createState() => new _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool state;

  @override
  void initState() {
    super.initState();
    _auth.onAuthStateChanged.firstWhere((user) => user != null).then((user) {
      debugPrint('AUTH STATE HAS CHANGED');
      debugPrint('user id: ' + user.uid);
      Navigator.of(context).pushReplacementNamed('/app');
    });

    //Navigator.pushNamed(context, UIData.dashboardRoute);

 //Navigator.of(context).pushReplacementNamed('/login');
    //new Future.delayed(new Duration(seconds: 1)).then((_) => signInWithGoogle());
  }


  @override
  Widget build(BuildContext context) {
    return new Text('splash 123');
  }
}

class AppPage extends StatelessWidget {
  void _logout() {
    debugPrint('pressed logout button');
    signOutWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('In Da App'),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), 
          onPressed:() async {
                await signOutWithGoogle();
                Navigator.of(context).pushReplacementNamed('/login');
              }),
        ],
      ),
      body: new Text('Welcome'),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Text('You gotta login'),
    );
  }
}

void main() {
  
  runApp(home());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}*/
