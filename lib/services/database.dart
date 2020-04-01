import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rep_pirlo_1_dec/app/home/models/job.dart';
import 'package:rep_pirlo_1_dec/services/api_path.dart';

abstract class Database {
  Future<void> createJob(Job job);
  void readJobs();
}

class FirestoreDatabase implements Database {
  final String uid;

  FirestoreDatabase({@required this.uid}) : assert(uid != null);

  Future<void> createJob(Job job) async =>
      await _setData(path: APIPath.job(uid, 'job_abc'), data: job.toMap());

  void readJobs() {
    final path = APIPath.jobs(uid);
    final reference = Firestore.instance.collection(path);
    final snapshots = reference.snapshots();
    snapshots.listen((snapshot) { //przeglada all documents w kolekcji i nastepnie printuje dane zawarte w snapshocie tego document, argument snapshot w tej metodzie to snapshot kolekcji przetrzymującej listę documentów
      snapshot.documents.forEach((snapshot) => print(snapshot.data));
    });
  }

  Future<void> _setData({String path, Map<String, dynamic> data}) async {
    final reference = Firestore.instance.document(path);
    print('$path: $data');
    await reference.setData(data);
  }
}
