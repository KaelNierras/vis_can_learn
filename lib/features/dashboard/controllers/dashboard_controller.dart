import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vis_can_learn/features/dashboard/models/set_model.dart';

Future<List<Sets>> getReviewers(String email) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> collectionRef = firestore.collection('sets');

  QuerySnapshot<Map<String, dynamic>> querySnapshot = await collectionRef.where('set_owner', arrayContains: email).get();

  List<Sets> reviewers = [];

  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      Map<String, dynamic> data = doc.data();
      String setName = data['set_name'];
      String setId = data['set_id'];
      int setArrayCount = data['set_array'].length;
      reviewers.add(Sets(name: setName, count: setArrayCount, id: setId));
    } else {
      throw Exception("No such document.");
    }
  }

  return reviewers;
}