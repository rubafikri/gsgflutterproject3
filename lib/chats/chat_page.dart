import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Auth/helpers/firestore_helper.dart';
import 'package:flutter_application_2/Auth/providers/auth_provider.dart';
import 'package:flutter_application_2/chats/profile_page.dart';
import 'package:flutter_application_2/services/routes_helper.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  static final String routeName = 'chatPage';
  TextEditingController textEditingController = TextEditingController();
  String message;
  sendToFirestore() async {
    textEditingController.clear();
    FirestoreHelper.firestoreHelper.addMessageTofirestore(
        {'message': this.message, 'dateTime': DateTime.now()});
  }

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.2),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                RouteHelper.routeHelper.goToPage(ProfilePage.routeName);
              },
              icon: Icon(
                Icons.person,
                color: Color(0xffFA4C60),
              ))
        ],
        backgroundColor: Color(0xff2B2B2B),
        title: Text('Group Chat'),
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
                        Future.delayed(Duration(seconds: 1)).then((value) {
                          scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.easeInOut);
                        });
                        QuerySnapshot<Map<String, dynamic>> querySnapshot =
                            datasnapshot.data;
                        List<Map> messages =
                            querySnapshot.docs.map((e) => e.data()).toList();
                        return ListView.builder(
                            shrinkWrap: true,
                            controller: scrollController,
                            itemCount: messages.length,
                            itemBuilder: (context, index) {
                              bool isMe = messages[index]['userId'] ==
                                  Provider.of<AuthProvider>(context,
                                          listen: false)
                                      .myId;
                              return isMe
                                  ? Container(
                                      child: ChatBubble(
                                        alignment: Alignment.topRight,
                                        margin:
                                            EdgeInsets.only(top: 20, right: 10),
                                        backGroundColor: Color(0xffFA4C60),
                                        child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7),
                                            child: messages[index]
                                                        ['imageUrl'] ==
                                                    null
                                                ? Text(
                                                    messages[index]['message'],
                                                    style: TextStyle(
                                                        color: Colors.white))
                                                : Image.network(messages[index]
                                                    ['imageUrl'])),
                                        clipper: ChatBubbleClipper5(
                                            type: BubbleType.sendBubble),
                                      ),
                                    )
                                  : ChatBubble(
                                      backGroundColor: Colors.grey,
                                      margin:
                                          EdgeInsets.only(top: 20, left: 10),
                                      child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                          ),
                                          child: messages[index]['imageUrl'] ==
                                                  null
                                              ? Text(
                                                  messages[index]['message'],
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              : Image.network(
                                                  messages[index]['imageUrl'])),
                                      clipper: ChatBubbleClipper5(
                                          type: BubbleType.receiverBubble),
                                    );
                            });
                      },
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff2B2B2B),
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    hintText: 'Type Your Message',
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none)),
                                controller: textEditingController,
                                onChanged: (x) {
                                  this.message = x;
                                },
                              )),
                              IconButton(
                                  onPressed: () {
                                    provider.sendImageToChat();
                                  },
                                  icon: Icon(
                                    Icons.image,
                                    color: Color(0xffFA4C60),
                                  )),
                              IconButton(
                                onPressed: () {
                                  sendToFirestore();
                                },
                                icon: Icon(
                                  Icons.send,
                                  color: Color(0xffFA4C60),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
