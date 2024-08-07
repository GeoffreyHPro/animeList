import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String img;
  final Widget content;

  const Background({super.key, required this.img, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(img), fit: BoxFit.fill)),
      child: content,
    );
  }
}
