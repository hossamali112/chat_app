import 'package:chat_app/features/chat_screen.dart';
import 'package:chat_app/features/login_screen.dart';
import 'package:chat_app/widgets/show_snak_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void Register_auth(String email, String password, context) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    Navigator.pushNamed(context, LoginScreen.routename);
    showSnackBar(context, 'Success');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      showSnackBar(context, 'The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      showSnackBar(context, 'The account already exists for that email.');
    }
  } catch (e) {
    showSnackBar(context, 'there is an error');
  }
}

void Login_auth(String email, String password, context) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    showSnackBar(context, 'Success');
    Navigator.pushNamed(context, ChatScreen.routename,arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showSnackBar(context, 'No user found for that email.');
    } else if (e.code == 'wrong-password') {
      showSnackBar(context, 'Wrong password provided for that user.');
    }
  } catch (e) {
    showSnackBar(context, 'there is an error');
  }
}
