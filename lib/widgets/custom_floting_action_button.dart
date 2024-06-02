import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  CustomFloatingActionButton({required this.text, required this.onpressed});

  String text;
  VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      backgroundColor: Colors.blue,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
