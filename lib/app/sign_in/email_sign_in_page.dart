import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/email_sign_in_form.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Email Sign in'),
        centerTitle: true,
        elevation: 10,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
              child: EmailSignInForm(
            auth: auth,
          )),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
