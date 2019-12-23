import 'package:flutter/services.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_alert_dialog.dart';
import 'package:meta/meta.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required PlatformException exception,
  }) : super(
    title: title,
    content: exception.message,
    defaultActionText: 'Ok'
  );
}
