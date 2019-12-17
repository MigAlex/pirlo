import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/home_page.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/sign_in_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  FirebaseUser _user;

  @override
  void initState() {//w141
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async{ //w142
    FirebaseUser user = await FirebaseAuth.instance.currentUser(); 
    _updateUser(user);
  }

  void _updateUser(FirebaseUser user) {
    setState(() {
      //W137
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        onSignIn: _updateUser, //to samo co (user) => _updateUser(user)
      );
    }
    return HomePage(
      onSignOut: () => _updateUser(
          null), //null gdyz nie ma potrzeby wyszczegolniac FirebaseUsera
    ); // temporary placeholder for HomePage
  }
}
