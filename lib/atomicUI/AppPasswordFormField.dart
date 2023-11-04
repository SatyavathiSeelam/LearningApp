import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppPasswordTextField extends StatefulWidget {
  String title;
  TextEditingController controller;
  String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  AppPasswordTextField(
      {required this.title,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.inputFormatters,
      super.key});

  @override
  State<AppPasswordTextField> createState() => _AppPasswordTextFieldState();
}

class _AppPasswordTextFieldState extends State<AppPasswordTextField> {
  bool isDataVisible =false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Color.fromRGBO(41, 41, 48, 1)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: IconButton(
              onPressed: (){
                isDataVisible=!isDataVisible;
              },
              icon: isDataVisible
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintStyle: const TextStyle(fontSize: 14, color: Color(0xffaaaaaa)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffaaaaaa)),
                borderRadius: BorderRadius.circular(8)),
          ),
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          obscureText: !isDataVisible,
        ),
      ],
    );
  }
}
