import 'package:chat_app/auth.dart';
import 'package:chat_app/features/login_screen.dart';
import 'package:chat_app/widgets/chat_icon.dart';
import 'package:chat_app/widgets/custom_floting_action_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/constants.dart';
import '../widgets/textfield.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  static String routename = 'Sign up Screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? password;

  String? passwordConfirmation;

  GlobalKey<FormState> fromKey = GlobalKey();

  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: kPrimaryColor,
        body: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.88,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(),
                ChatIcon(iconSize: 100,),
                    const Spacer(),
                    // CustomTextFormField(
                    //   hint: 'Full Name',
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hint: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      obscureText: true,
                      onChanged: (data) {
                        password = data;
                      },
                      hint: 'Password',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // CustomTextFormField(
                    //   onChanged: (data){
                    //     password = passwordConfirmation;
                    //   },
                    //   hint: 'Password Confirmation',
                    // ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(

                      children: [
                        Expanded(
                          child: CustomFloatingActionButton(
                              text: 'Sign up',
                              onpressed: () {


                                if (fromKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});
                                  Register_auth(email!, password!, context);
                                  setState(() {isLoading = false;});
                                }


                              }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'I dont have account',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, LoginScreen.routename);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.white,
                                decorationThickness: 2,
                              ),
                            )),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
