import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';

abstract class Database {
  Future<void> createJob(Job job);
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> createJob(Job job) async{
    final path = '/users/$uid/jobs/job_abc';
    final documentReference = Firestore.instance.document(path);
    await documentReference.setData(job.toMap()); //returns future
  }
}
