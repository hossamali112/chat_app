import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatIcon extends StatelessWidget {
   ChatIcon({required this.iconSize});
   double iconSize;

  @override
  Widget build(BuildContext context) {
    return  Icon(
      CupertinoIcons.chat_bubble_2,
      color: Colors.blue,
      size: iconSize,
    );
  }
}
