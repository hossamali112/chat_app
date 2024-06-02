import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({required this.hint,this.onChanged,this.obscureText = false});
  String hint;
  Function(String)? onChanged;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if(value!.isEmpty){
          return 'value is wrong';
        }
      },
      onChanged: onChanged,
      cursorColor: Colors.white,

      style: const TextStyle(
        color: Colors.white,

      ),
      decoration: InputDecoration(

        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.white)

        ),

        labelText: hint,
        labelStyle: const TextStyle(color: Colors.white),
        focusColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),

          borderSide: const BorderSide(color: Colors.white,),
        )
      ),
    );
  }
}
