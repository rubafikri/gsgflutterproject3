import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  static final String routName = 'cahtPage';
  String message;
  sendToFirestore() async {
    FirestoreHelper.firestoreHelper.addMessageTofirestore(
        {'message': this.message, 'dateTime': DateTime.now()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Group chat'),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, x) {
            return Container(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        stream:
                            FirestoreHelper.firestoreHelper.getFirstoreStream(),
                        builder: (context, datasnapshot) {
                          QuerySnapshot<Map<String, dynamic>> querySnapshot =
                              datasnapshot.data;
                          List<Map> messages =
                              querySnapshot.docs.map((e) => e.data()).toList();
                          return ListView.builder(
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                return Text(messages[index]['message']);
                              });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                            child: TextField(
                          onChanged: (x) {
                            this.message = x;
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )),
                        Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.orangeAccent,
                            ),
                            child: IconButton(
                                onPressed: () {
                                  sendToFirestore();
                                },
                                icon: Icon(Icons.send)))
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
