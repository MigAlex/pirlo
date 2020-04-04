import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_pirlo_1_dec/app/home/jobs/jobs_page.dart';

import 'package:rep_pirlo_1_dec/app/sign_in/sign_in_page.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';
import 'package:rep_pirlo_1_dec/services/database.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            if (user == null) {
              return SignInPage.create(context);
            }
            return Provider<Database>(
              create: (context) => FirestoreDatabase(uid: user.uid),
              child: JobsPage());
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
