import 'package:rep_pirlo_1_dec/app/custom_widgets/custom_raised_button.dart';
import 'package:flutter/material.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
  }) : super(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 22)),
          height: 44,
          color: Colors.blueGrey,
          borderRadius: 4,
          onPressed: onPressed,
        );
}
