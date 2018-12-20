import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = new GoogleSignIn();

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);
    print("User Name :${user.displayName}");
    return user;
  }

  void _signOut() {
    googleSignIn.signOut();
    print("User Signed Out");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Center(
          child: Row(
            children: <Widget>[
              new RaisedButton(
                  child: new Text("Sign In"),
                  color: Colors.green,
                  onPressed: () => _signIn()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e))),
              new RaisedButton(
                child: new Text("Sign Out"),
                color: Colors.green,
                onPressed: () => _signOut(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
