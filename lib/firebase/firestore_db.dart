import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/shared/models/task.model.dart';

class FirestoreDb {
  static Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];

    QuerySnapshot snapshots =
        await FirebaseFirestore.instance.collection('tasks').get();
    for (QueryDocumentSnapshot doc in snapshots.docs) {
      tasks.add(TaskModel.fromJson(doc.data() as Map<String, dynamic>));
    }
    return tasks;
  }
}
