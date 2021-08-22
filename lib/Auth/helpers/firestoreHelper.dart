import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/registerRequest.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  addUserToFirestore(RegisterRequest registerRequest) async {
    DocumentReference documentReference = await firebaseFirestore
        .collection('Users')
        .add(registerRequest.toMap());
    print(documentReference.id);
  }
}
