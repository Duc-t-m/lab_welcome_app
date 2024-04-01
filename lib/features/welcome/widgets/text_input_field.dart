import 'package:flutter/material.dart';

class TextInputField extends StatefulWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const TextInputField({
    super.key,
    required this.iconData,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<TextInputField> createState() => _TextInputFieldState();
}

class _TextInputFieldState extends State<TextInputField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        prefixIcon: Icon(
          widget.iconData,
          color: Colors.grey.withOpacity(0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
