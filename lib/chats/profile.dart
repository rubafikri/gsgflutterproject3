import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  static final routeName = 'Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).getUserFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('Profile Page'),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<AuthProvider>(context, listen: false).logout();
                },
                icon: Icon(Icons.edit)),
            IconButton(onPressed: () {}, icon: Icon(Icons.logout))
          ],
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, x) {
            return provider.userModel == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/chatapp-b50ca.appspot.com/o/images%2Fprofiles%2Fimage_picker8541357376011461990.jpg?alt=media&token=c7f644dd-59de-410e-8282-ed780582f27a'),
                      ),
                      ItemWidget('First Name', provider.userModel.fName),
                      ItemWidget('Last Name', provider.userModel.lName),
                      ItemWidget('Email', provider.userModel.email),
                      ItemWidget('City', provider.userModel.city),
                      ItemWidget('Country', provider.userModel.country),
                    ],
                  );
          },
        ));
  }
}

class ItemWidget extends StatelessWidget {
  String label;
  String value;
  ItemWidget(this.label, this.value);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 22),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 22),
          )
        ],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
    );
  }
}
