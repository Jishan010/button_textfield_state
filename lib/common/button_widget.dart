import 'package:flutter/material.dart';

/// A stateful widget to display a button.
/// @param [buttonText] The text to display on the button.
/// @param [onTapEvent] The callback to be called when the button is pressed.
/// @param [isEnable] The boolean to enable or disable the button.
class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.onTapEvent,
      required this.buttonText,
      this.isEnable = true})
      : super(key: key);

  final String buttonText;
  final bool isEnable;
  final VoidCallback onTapEvent;

  /// Function to retrive the button's forground color based on the Button (MaterialState) State value.
  Color getForegroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.contains(MaterialState.disabled)) {
      return Colors.white;
    } else if (states.any(interactiveStates.contains)) {
      return Colors.white;
    } else {
      return Colors.white;
    }
  }

  /// Function to retrive the button's background color based on the Button (MaterialState) State value.
  Color getBackgroundColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.contains(MaterialState.disabled)) {
      return const Color(0xff97999B);
    } else if (states.any(interactiveStates.contains)) {
      return const Color(0xff004364);
    } else {
      return const Color(0xff005C8A);
    }
  }

  @override
  Widget build(BuildContext context) {
    final forgroundColor =
        MaterialStateProperty.resolveWith<Color>(getForegroundColor);

    final backgroundColor =
        MaterialStateProperty.resolveWith<Color>(getBackgroundColor);

    final buttonStyle = ButtonStyle(
      backgroundColor: backgroundColor,
      foregroundColor: forgroundColor,
    );

    return ElevatedButton(
      style: buttonStyle,
      onPressed: isEnable ? onTapEvent : null,
      child: Text(buttonText),
    );
  }
}
