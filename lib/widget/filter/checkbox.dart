import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final dynamic fct;
  final List<Checked> valuesList;

  const CheckBoxWidget(
      {super.key, required this.fct, required this.valuesList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        valuesList.length,
        (index) => CheckboxListTile(
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
  final String name;

  Checked(this.name, {required this.checked});
}
