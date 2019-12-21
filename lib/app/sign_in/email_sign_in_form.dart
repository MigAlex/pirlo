import 'package:flutter/material.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration:
            InputDecoration(labelText: 'Email', hintText: 'Elo@gmail.com'),
      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(
        height: 8,
      ),
      RaisedButton(
        child: Text('Sign in'),
        onPressed: () {},
      ),
      SizedBox(
        height: 8,
      ),
      FlatButton(
        child: Text('Need an account? Register!'),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
