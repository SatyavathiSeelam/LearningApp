import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String title;
  void Function() onPressed;


  AppButton({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: const Color(0xff5956E9)),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffffffff)),
            )),
      ),
    );
  }
}
