import 'package:flutter/material.dart';

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
