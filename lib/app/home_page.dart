import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';


class HomePage extends StatelessWidget {
  HomePage({@required this.auth, @required this.onSignOut});
  final VoidCallback onSignOut;
  final AuthBase auth;

  Future<void> _signOut() async { //W139
    try {
      await auth.signOut();
      onSignOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Log out',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: _signOut,
          )
        ],
      ),
    );
  }
}
