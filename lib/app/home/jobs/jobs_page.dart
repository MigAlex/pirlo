import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_alert_dialog.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_exception_alert_dialog.dart';

import 'package:rep_pirlo_1_dec/app/home/jobs/edit_job_page.dart';
import 'package:rep_pirlo_1_dec/app/home/jobs/job_list_tile.dart';
import 'package:rep_pirlo_1_dec/app/home/jobs/list_items_builder.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';
import 'package:rep_pirlo_1_dec/services/auth.dart';
import 'package:rep_pirlo_1_dec/services/database.dart';

class JobsPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await PlatformAlertDialog(
      title: 'Log Out',
      content: 'Are you sure?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Log Out',
    ).show(context);

    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  Future<void> _delete(BuildContext context, Job job,
      {JobsListTile child}) async {
    try {
      final database = Provider.of<Database>(context);
      await database.deleteJob(job);
    } on PlatformException catch (e) {
      PlatformExceptionAlertDialog(title: 'Operation failed', exception: e)
          .show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Log out',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () => _confirmSignOut(context),
          )
        ],
      ),
      body: _buildContents(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => EditJobPage.show(context),
      ),
    );
  }

  Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context);
    return StreamBuilder<List<Job>>(
        stream: database.jobsStream(),
        builder: (context, snapshot) {
          return ListItemBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context, job) => Dismissible(
              key: Key('job-${job.id}'),
              background: Container(color: Colors.red),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => _delete(context, job),
              child: JobsListTile(
                job: job,
                onTap: () => EditJobPage.show(context, job: job),
              ),
            ),
          );
        });
  }
}
