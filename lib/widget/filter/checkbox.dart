import 'package:flutter/material.dart';
import 'package:projet_tm/services/api/filter.dart';

class CheckBoxWidget extends StatelessWidget {
  final dynamic fct;
  List<Checked> valuesList = filterSearch.types;

  CheckBoxWidget({super.key, required this.fct, required this.valuesList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        valuesList.length,
        (index) => CheckboxListTile(
          activeColor: Colors.black,
          controlAffinity: ListTileControlAffinity.leading,
          contentPadding: EdgeInsets.zero,
          dense: true,
          title: Text(
            valuesList[index].name,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
          value: valuesList[index].checked,
          onChanged: (value) {
            fct(value, index);
          },
        ),
      ),
    );
  }
}

class Checked {
  bool checked;
  String name;

  Checked({required this.name, required this.checked});
}
