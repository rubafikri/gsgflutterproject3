import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/registerRequest.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addUserToFirestore(RegisterRequest registerRequest) async {
    await firebaseFirestore
        .collection('Users')
        .doc(registerRequest.id)
        .set(registerRequest.toMap());
  }

  getUserFromFirestore(String id) async {
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('Users').doc(id).get();
    print(documentSnapshot.data());
  }
}
