import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/form_submit_button.dart';

class EmailSignInForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _submit(){
    print('email: ${_emailController.text}, password: ${_passwordController.text}');
  }
  List<Widget> _buildChildren() {
    return [
      TextField(
        controller: _emailController,
        decoration:
            InputDecoration(labelText: 'Email', hintText: 'Elo@gmail.com'),

      ),
      SizedBox(
        height: 8,
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
      ),
      SizedBox(
        height: 8,
      ),
      RaisedButton(
        child: Text('Sign in'),
        onPressed: _submit,
      ),
      SizedBox(
        height: 8,
      ),
      FormSubmitButton(
        text: 'Sign In',
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
