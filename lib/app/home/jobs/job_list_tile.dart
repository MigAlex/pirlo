import 'package:flutter/material.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';

class JobsListTile extends StatelessWidget {

  final Job job;
  final VoidCallback onTap;

  const JobsListTile({Key key, @required this.job, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(job.name),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}