import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/models/registerRequest.dart';
import 'package:flutter_application_2/models/userModel.dart';

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

  Future<List<UserModel>> getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('Users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<UserModel> users =
        docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(users.length);
    print(users[1].email);

    return users;
  }
}
