import 'package:flutter/material.dart';

class CustomtTextField extends TextField {
  CustomtTextField(
      {super.key,
      required TextEditingController controller,
      required String label,
      required Function(String) onChangedFunction})
      : super(
          controller: controller,
          onChanged: onChangedFunction,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: label,
          ),
        );
}
