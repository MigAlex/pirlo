import 'package:flutter/foundation.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';
import 'package:rep_pirlo_1_dec/services/api_path.dart';
import 'package:rep_pirlo_1_dec/services/firestore_service.dart';

abstract class Database {
  Future<void> setJob(Job job);
  Stream<List<Job>> jobsStream();
}

String documentIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  final _service = FireStoreService.instance;

  Future<void> setJob(Job job) async => await _service.setData(
      path: APIPath.job(uid, job.id), data: job.toMap());

  Stream<List<Job>> jobsStream() => _service.collectionStream(
      path: APIPath.jobs(uid), builder: (data, documentId) => Job.fromMap(data, documentId));
}
