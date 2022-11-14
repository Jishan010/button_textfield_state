import 'package:flutter/material.dart';

class CommonTextFormField extends StatefulWidget {
  CommonTextFormField(
      {super.key,
      this.labelText = '',
      this.helperText = '',
      this.isEnable = true,
      this.errorText = '',
      this.isFilled = false,
      required this.onTextChanged,
      this.titleTextAlign = TextAlign.center,
      required this.isPassword,
      required this.hintText,
      required this.textController});

  String labelText;
  final String helperText;
  final TextAlign titleTextAlign;
  final bool isPassword;
  final String hintText;
  final String errorText;
  final ValueChanged<String> onTextChanged;
  final TextEditingController textController;
  final bool isEnable;
  final bool isFilled;

  @override
  CommonTextFormFieldState createState() => CommonTextFormFieldState();
}

class CommonTextFormFieldState extends State<CommonTextFormField> {
  final FocusNode _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    debugPrint("Focus: ${_focus.hasFocus.toString()}");
    if (_focus.hasFocus) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnable,
      obscureText: widget.isPassword,
      focusNode: _focus,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: !widget.isEnable,
        fillColor: Color(0xffEEEEEE),
        errorText: widget.errorText == '' ? null : widget.errorText,
        contentPadding: const EdgeInsets.all(10.0),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black26),
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Color(0xffBBBCBC)),
        helperText: widget.helperText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffBBBCBC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff005C8A)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffB3261E)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffB3261E)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffEEEEEE)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xffBBBCBC)),
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

enum InputState { normal, active, filled, disabled, readOnly, error }
