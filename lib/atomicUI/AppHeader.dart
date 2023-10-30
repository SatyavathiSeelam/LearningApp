import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  String header;
  String subHeader = "";

  AppHeader.withHeader({required this.header, super.key});

  AppHeader.withSubHeader(
      {required this.header, required this.subHeader, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(41, 41, 48, 1)),
        ),
        if (subHeader.isNotEmpty)...[
          const SizedBox(height: 12,),
          Text(
            subHeader,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color.fromRGBO(138, 144, 162, 1)),
          ),
        ]
      ],
    );
  }
}
