import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_alert_dialog.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';



class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async { 
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async{
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Log Out',
      content: 'Are you sure?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Log Out',
    ).show(context);

    if(didRequestSignOut == true){
      _signOut(context);
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
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
    );
  }
}
