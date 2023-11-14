import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback voidCallback;
  final String txt;
  final Color color;

  const CustomBtn(
      {super.key,
      required this.voidCallback,
      required this.txt,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => voidCallback(),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: color),
        child: Text(txt),
      ),
    );
  }
}
