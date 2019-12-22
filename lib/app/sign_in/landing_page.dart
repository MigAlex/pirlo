import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_pirlo_1_dec/app/home_page.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/sign_in_page.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';


class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          //to informuje nas czy dostalismy pierwsza dane jako stream
          User user = snapshot.data;
          if (user == null) {
            return SignInPage();
          }
          return HomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
