import 'package:chat_app/features/chat_screen.dart';
import 'package:chat_app/features/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(myapp());
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routename: (context) => LoginScreen(),
        SignUpScreen.routename: (context) => SignUpScreen(),
        ChatScreen.routename: (context) => ChatScreen(),
      },
      initialRoute: SignUpScreen.routename,
    );
  }
}
