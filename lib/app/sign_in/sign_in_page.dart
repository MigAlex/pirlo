import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/sign_in_button.dart';
import 'package:rep_pirlo_1_dec/app/sign_in/social_sign_in_button.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInPage extends StatelessWidget {
  SignInPage({@required this.onSignIn});
  final Function(FirebaseUser) onSignIn;

  Future<void> _signInAnonymously() async {
    try {
      final authResult = await FirebaseAuth.instance.signInAnonymously();
      onSignIn(authResult.user);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time tracker'),
        centerTitle: true,
        leading: Icon(
          Icons.timer,
          color: Colors.amber,
        ),
        elevation: 10,
      ),
      body: _buildContent(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent() {
    //bezpieczniej dac metode jako Widget zamiast Container
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 18,
          ),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black87,
            color: Colors.white,
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          SocialSignInButton(
            assetName: 'images/facebook-logo.png',
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          SignInButton(
            text: 'Sign in with email',
            textColor: Colors.white,
            color: Colors.teal[500],
            onPressed: () {},
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'or',
            style: TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8,
          ),
          SignInButton(
            text: 'Go as annonymous',
            textColor: Colors.black,
            color: Colors.amber[300],
            onPressed: _signInAnonymously,
          ),
        ],
      ),
    );
  }
}
