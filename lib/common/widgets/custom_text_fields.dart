import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool readOnly;
  final VoidCallback? ontap;
  final Icon? sufficIcon;
  final Color? suffixIconColor;
  final Function(String)? onChanged;

  const CustomTextField(
      {Key? key,
      required this.hintText,
      required this.controller,
      this.readOnly = false,
      this.ontap,
      this.onChanged,
      this.suffixIconColor,
      this.sufficIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          suffixIcon: sufficIcon,
          suffixIconColor: suffixIconColor,
        ),
        onTap: ontap,
        onChanged: onChanged,
      ),
    );
  }
}
