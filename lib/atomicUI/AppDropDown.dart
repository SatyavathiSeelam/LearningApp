import 'package:flutter/material.dart';

class AppDropDown extends StatelessWidget {
  List<String> items;
  void Function(String?)? onChanged;
  String? Function(String?)? validator;
  String title;
  String selectedItem;

  AppDropDown(
      {required this.title,
      required this.items,
      required this.selectedItem,
      required this.onChanged,
      this.validator,
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
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          value: selectedItem,
          isExpanded: true,
          isDense: true,
          items: items
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
