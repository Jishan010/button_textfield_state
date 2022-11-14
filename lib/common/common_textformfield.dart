//implement commmom textformfield
import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  const CommonTextFormField(
      {super.key,
      this.labelText = '',
      this.helperText = '',
      this.isEnable = true,
      this.errorText = '',
      required this.onTextChanged,
      this.titleTextAlign = TextAlign.center,
      required this.isPassword,
      required this.hintText,
      required this.textController});

  final String labelText;
  final String helperText;
  final TextAlign titleTextAlign;
  final bool isPassword;
  final String hintText;
  final String errorText;
  final ValueChanged<String> onTextChanged;
  final TextEditingController textController;
  final bool isEnable;

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnable,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        filled: true,
        errorText: widget.errorText == '' ? null : widget.errorText,
        contentPadding: const EdgeInsets.all(10.0),
        hintText: widget.hintText,
        // pass the hint text parameter here
        hintStyle: const TextStyle(color: Colors.black26),
        labelText: widget.labelText,
        helperText: widget.helperText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      controller: widget.textController,
      onChanged: (text) {
        widget.onTextChanged(text);
      },
      style: const TextStyle(color: Colors.black),
    );
  }
}
