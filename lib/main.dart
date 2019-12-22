import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/landing_page.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';
import 'package:rep_pirlo_1_dec/services/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Time Tracker',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: LandingPage(),
      ),
    );
  }
}

