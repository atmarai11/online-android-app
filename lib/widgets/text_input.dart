import 'package:flutter/material.dart';

import 'mycolors.dart';

class TextInput extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String msg;

  final TextEditingController controller;
  final TextInputAction inputAction;
  final bool? obscureText;

  const TextInput({
    Key? key,
    required this.icon,
    required this.hint,
    required this.inputAction,
    required this.controller,
    required this.msg,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 18),
          hintText: hint,
          errorStyle: const TextStyle(
            color: Colors.redAccent,
            fontSize: 13,
          ),
          hintStyle: const TextStyle(
            color: MyColors.myGreen,
            fontSize: 14,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: MyColors.myGreen,
              width: 3.0,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          prefixIcon: Icon(
            icon,
            color: MyColors.myGreen,
          ),
        ),
        textInputAction: inputAction,
        obscureText: obscureText == null ? false : obscureText!,
        validator: (value) {
          if (value!.isEmpty) {
            return msg;
          } else {
            return null;
          }
        },
      ),
    );
  }
}
