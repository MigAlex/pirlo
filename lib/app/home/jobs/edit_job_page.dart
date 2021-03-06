import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_alert_dialog.dart';
import 'package:rep_pirlo_1_dec/app/custom_widgets/platform_exception_alert_dialog.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';
import 'package:rep_pirlo_1_dec/services/database.dart';
import 'package:flutter/services.dart';

class EditJobPage extends StatefulWidget {
  final Database database;
  final Job job;

  const EditJobPage({Key key, @required this.database, this.job}) : super(key: key);
  static Future<void> show(BuildContext context, {Job job}) async {
    final database = Provider.of<Database>(context);
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => EditJobPage(database: database, job: job),
      fullscreenDialog: true,
    ));
  }

  @override
  _EditJobPageState createState() => _EditJobPageState();
}

class _EditJobPageState extends State<EditJobPage> {
  final _formKey = GlobalKey<FormState>();

  String _name;
  int _ratePerHour;

  @override
  void initState(){
    super.initState();
    if (widget.job != null){
      _ratePerHour = widget.job.ratePerHour;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> _submit() async {
    if (_validateAndSaveForm()) {
      try {
        final jobs = await widget.database.jobsStream().first;
        final allNames = jobs.map((job) => job.name).toList();
        if (widget.job != null){
          allNames.remove(widget.job.name);
        }
        if (allNames.contains(_name)) {
          PlatformAlertDialog(
            title: 'Name already used',
            content: 'Choose different job name',
            defaultActionText: 'Ok',
          ).show(context);
        } else {
          final id = widget.job?.id ?? documentIdFromCurrentDate();
        final job = Job(id: id, name: _name, ratePerHour: _ratePerHour);
        await widget.database.setJob(job);
        Navigator.pop(context); }
      } on PlatformException catch (e) {
        PlatformExceptionAlertDialog(
          title: 'Operation failed',
          exception: e,
        ).show(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(widget.job == null ? 'New job' : 'Edit job'),
        actions: <Widget>[
          FlatButton(
              onPressed: _submit,
              child: Text('Save',
                  style: TextStyle(fontSize: 18, color: Colors.white)))
        ],
      ),
      body: _buildContents(),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContents() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _buildForm(),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildFormChildren(),
      ),
    );
  }

  List<Widget> _buildFormChildren() {
    return [
      TextFormField(
        decoration: InputDecoration(labelText: 'Job Name'),
        initialValue: _name,
        onSaved: (value) => _name = value,
        validator: (value) => value.isNotEmpty ? null : 'Name cannot be empty',
      ),
      TextFormField(
        decoration: InputDecoration(labelText: 'Rate per hour'),
        initialValue: _ratePerHour != null ?'$_ratePerHour' : null,
        onSaved: (value) => _ratePerHour = int.tryParse(value) ?? 0,
        keyboardType:
            TextInputType.numberWithOptions(signed: false, decimal: false),
      ),
    ];
  }
}
