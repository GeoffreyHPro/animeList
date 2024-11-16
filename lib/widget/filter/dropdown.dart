import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({super.key, required this.fct});
  final dynamic fct;

  final List<String> listTri = [
    "none",
    "desc_title",
    "asc_title",
    "desc_score",
    "asc_score"
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: listTri.first,
      onSelected: (value) {
        fct(value);
      },
      dropdownMenuEntries:
          listTri.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
