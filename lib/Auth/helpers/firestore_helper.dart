import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/models/UserModel.dart';
import 'package:flutter_application_2/Auth/models/register_request.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getFirstoreStream() {
    return firebaseFirestore.collection('Chats').snapshots();
  }

  addMessageTofirestore(Map map) async {
    firebaseFirestore
        .collection('Chats')
        .add({...map, 'userId': AuthHelper.authHelper.getUserId()});
  }

  addUserToFirestore(RegisterRequest registerRequest) async {
    try {
      // await firebaseFirestore.collection('Users').add(registerRequest.toMap());
      await firebaseFirestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<UserModel> getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
        await firebaseFirestore.collection('Users').doc(userId).get();

    return UserModel.fromMap(documentSnapshot.data());
  }

  Future<List<UserModel>> getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseFirestore.collection('Users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<UserModel> users =
        docs.map((e) => UserModel.fromMap(e.data())).toList();

    return users;
  }

  updateProfile(UserModel userModel) async {
    await firebaseFirestore
        .collection('Users')
        .doc(userModel.id)
        .update(userModel.toMap());
  }
}
