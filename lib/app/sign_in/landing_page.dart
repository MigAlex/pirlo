import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/home_page.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/sign_in_page.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';

class LandingPage extends StatefulWidget {
  LandingPage({@required this.auth});

  final AuthBase auth;
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {//w141
    super.initState();
    _checkCurrentUser();
  }

  Future<void> _checkCurrentUser() async{ 
    User user = await widget.auth.currentUser();
    _updateUser(user);
  }

  void _updateUser(User user) {
    setState(() {
      //W137
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
        auth: widget.auth,
        onSignIn: _updateUser, //to samo co (user) => _updateUser(user)
      );
    }
    return HomePage(
      auth: widget.auth,
      onSignOut: () => _updateUser(
          null), //null gdyz nie ma potrzeby wyszczegolniac FirebaseUsera
    ); // temporary placeholder for HomePage
  }
}
