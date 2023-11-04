import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppFormTextField extends StatelessWidget {
  String title;
  TextEditingController controller;
  String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  void Function()? onPressed;
  bool isPassword;
  bool isDataVisible;
  Icon? icon;

  AppFormTextField(
      {required this.title,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.inputFormatters,
      this.isPassword = false,
      this.onPressed = null,
      this.icon = null,
        this.isDataVisible = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromRGBO(41, 41, 48, 1)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: isPassword ? IconButton(
              onPressed: onPressed,
              icon: icon!,
            ): null,
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffaaaaaa)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffaaaaaa)),
                borderRadius: BorderRadius.circular(8)),
          ),
          validator: validator,
          inputFormatters: inputFormatters,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          obscureText: !isDataVisible,
        ),
      ],
    );
  }
}
