import 'package:flutter/material.dart';

Widget customtTextField(
    {required TextEditingController controller,
    required String label,
    required Function(String) onChangedFunction}) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
      controller: controller,
      onChanged: onChangedFunction,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
    ),
  );
}

Widget customBtn(
    {required VoidCallback voidCallback,
    required String txt,
    required Color color}) {
  return GestureDetector(
    onTap: () => voidCallback(),
    child: Container(
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.all(12.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: color),
      child: Text(txt),
    ),
  );
}
