import 'package:flutter/material.dart';

enum ButtonStyle { primary, secondary, disabled }

class Button extends StatelessWidget {
  final String text;
  final ButtonStyle style;

  const Button({
    required this.text,
    this.style = ButtonStyle.primary,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          primary: getPrimaryColor(),
          backgroundColor: getBackgroundColor(),
          side: style == ButtonStyle.secondary
              ? const BorderSide(width: 0, color: Colors.black87)
              : null,
        ),
        child: Text(text),
      ),
    );
  }

  Color getPrimaryColor() {
    switch (style) {
      case ButtonStyle.primary:
        return Colors.white;
      case ButtonStyle.secondary:
        return Colors.black87;
      case ButtonStyle.disabled:
        return Colors.white;
      default:
        return Colors.white;
    }
  }

  Color getBackgroundColor() {
    switch (style) {
      case ButtonStyle.primary:
        return Colors.green;
      case ButtonStyle.secondary:
        return Colors.white;
      case ButtonStyle.disabled:
        return const Color(0xFFE0E0E0);
      default:
        return Colors.green;
    }
  }
}
