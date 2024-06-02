import 'package:chat_app/helper/constants.dart';
import 'package:flutter/material.dart';


class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(


        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),

        ),
        child: Text(message,style: TextStyle(color: Colors.white),)
      ),
    );
  }

}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(


          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),

          ),
          child: Text(message,style: TextStyle(color: Colors.white),)
      ),
    );
  }

}
