import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  String title;
  Widget body;

  AppScaffold.withTitleBody(
      {required this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
        title: Text(
          title,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: body,
    );
  }
}
