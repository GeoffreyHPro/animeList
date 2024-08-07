import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final dynamic fct;
  final RangeValues currentValue;

  const SliderWidget(
      {super.key, required this.fct, required this.currentValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RangeSlider(
          activeColor: Colors.grey.shade800,
          values: currentValue,
          max: 10,
          divisions: 10,
          labels: RangeLabels(
            currentValue.start.round().toString(),
            currentValue.end.round().toString(),
          ),
          onChanged: (RangeValues value) {
            fct(value);
          },
        ),
      ],
    );
  }
}
