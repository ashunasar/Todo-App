import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/shared/utils/app_logger.dart';

class FirestoreDb {
  static void getTasks() async {
    final collectionRef = FirebaseFirestore.instance.collection('tasks');
    // AppLogger.printLog(collectionRef.snapshots());
    collectionRef.snapshots().forEach((element) {
      AppLogger.printLog(element.docs.first.data());
    });
  }
}
