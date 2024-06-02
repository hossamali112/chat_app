

import 'package:chat_app/helper/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:chat_app/widgets/chat_icon.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  static String routename = 'Home Screen';
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessageCollections);
  final ScrollController _controller = ScrollController();

  TextEditingController controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for(int i = 0 ; i < snapshot.data!.docs.length; i++){
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(


                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: kPrimaryColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ChatIcon(iconSize: 40),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                body: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemBuilder: (context, index) {

                          return
                            messagesList[index].id == email ?
                            ChatBubble(
                              message: messagesList[index].message,
                            ) : ChatBubbleForFriend(
                                message: messagesList[index].message);

                        },
                        itemCount: messagesList.length,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller,
                        onFieldSubmitted: (data) {
                          messages.add({
                            kMessage: data,
                            kCreatedAt: DateTime.now(),
                            kid: email,
                          });
                          controller.clear();
                          _controller.animateTo(
                            0,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        cursorColor: kPrimaryColor,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {


                            },
                            icon: Icon(Icons.send),
                            color: kPrimaryColor,
                          ),
                          hintText: 'Send message',
                          hintStyle: TextStyle(color: kPrimaryColor),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide(color: kPrimaryColor)),
                        ),
                      ),
                    ),
                  ],
                ));
          }
          if (snapshot.hasError || snapshot.data?.docs == null) {
            print(snapshot.error.toString());
            return Center(
                child: Column(
                  children: [
                    Text(snapshot.data?.docs.toString() ??
                        snapshot.error.toString()),
                    ElevatedButton(
                        onPressed: () {}, child: const Text('Try Again')),
                  ],
                ));
          }
          return const Center(
              child: CircularProgressIndicator()
          );
        });
  }
}
