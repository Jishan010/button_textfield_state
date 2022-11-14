import 'package:flutter/material.dart';

/// TextFormFieldWidget - A stateful widget to display a Text Form Field.
/// @param [labelText] The text to display on the label.
/// @param [hintText] The text to display on the hint.
/// @param [errorText] The boolean to display the error message.
/// @param [isEnable] The boolean to enable or disable the text field.
/// @param [textController] The controller to handle the text field's value.
/// @param [onTextChanged] The callback to be called when the text field's value is changed.
/// @param [isPassword] The boolean to display the text field as password field.
/// @param [keyboardType] The keyboard type to display on the text field.
class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget(
      {super.key,
      this.labelText = '',
      this.helperText = '',
      this.isEnable = true,
      this.errorText = '',
      required this.onTextChanged,
      this.keyboardType = TextInputType.text,
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
  final TextInputType keyboardType;

  @override
  TextFormFieldWidgetState createState() => TextFormFieldWidgetState();
}

class TextFormFieldWidgetState extends State<TextFormFieldWidget> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(widget.labelText,
              style: TextStyle(
                  color: widget.errorText.isNotEmpty
                      ? const Color(0xFFB3261E)
                      : const Color(0xFF004364),
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
        TextFormField(
          keyboardType: widget.keyboardType,
          enabled: widget.isEnable,
          obscureText: widget.isPassword,
          focusNode: _focus,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            filled: !widget.isEnable || widget.errorText.isNotEmpty,
            fillColor: widget.errorText.isNotEmpty
                ? const Color(0x1AB3261E)
                : const Color(0xffEEEEEE),
            errorText: widget.errorText.isEmpty ? null : widget.errorText,
            contentPadding: const EdgeInsets.all(10.0),
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: Colors.black26),
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Color(0xffBBBCBC)),
            helperText: widget.helperText,
            helperStyle: const TextStyle(color: Color(0xffB3261E)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xffBBBCBC)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xff005C8A)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xffB3261E)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xffB3261E)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xffEEEEEE)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Color(0xffBBBCBC)),
            ),
          ),
          controller: widget.textController,
          onChanged: (text) {
            widget.onTextChanged(text);
          },
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
