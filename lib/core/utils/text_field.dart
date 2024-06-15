import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;

  final String hint;
  final Widget suffixIcon;
  final Function() suffixPressed;
  final Function(String)? onChanged;
  final validation;
  final Color suffixColor;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.suffixIcon,
    required this.suffixPressed,
    required this.suffixColor,
    required this.validation, this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      style: Theme.of(context).textTheme.bodySmall,
      controller: controller,
      validator: validation,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        suffixIcon: IconButton(
            onPressed: suffixPressed, icon: suffixIcon, color: suffixColor),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        filled: false,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white60, width: 0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
