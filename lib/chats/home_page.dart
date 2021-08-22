import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/auth_helper.dart';
import 'package:flutter_application_2/Auth/helpers/firestoreHelper.dart';
import 'package:flutter_application_2/models/userModel.dart';

class HomePage extends StatelessWidget {
  static final routeName = 'home';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
            child: FutureBuilder<List<UserModel>>(
                future:
                    FirestoreHelper.firestoreHelper.getAllUsersFromFirestore(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasData && snapshot.data == null) {
                    return Center(
                      child: Text('No Users'),
                    );
                  } else {
                    List<UserModel> data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            subtitle: Text(data[index].email ?? 'aa@gmail.com'),
                            title: Text(
                              data[index].firstName ?? 'ruba',
                            ),
                          ));
                        });
                  }
                })));
  }
}
