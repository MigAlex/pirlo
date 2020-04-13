import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyContent(
      {Key key, this.title = 'Nothing', this.message = 'Add new jobs'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title, style: TextStyle(fontSize: 32, color: Colors.black54)),
          Text(message, style: TextStyle(fontSize: 22, color: Colors.black54)),
        ],
      ),
    );
  }
}
