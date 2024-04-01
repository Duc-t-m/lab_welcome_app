import 'package:flutter/material.dart';

class PasswordInputField extends StatefulWidget {
  final IconData iconData;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const PasswordInputField({
    super.key,
    required this.iconData,
    required this.hintText,
    required this.controller,
    this.validator,
  });

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  late bool _showPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5)),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: Colors.grey.withOpacity(0.5),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          icon: Icon(
            _showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.withOpacity(0.5),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.white,
      ),
      obscureText: !_showPassword,
      enableSuggestions: false,
      autocorrect: false,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _showPassword = false;
  }
}
