import 'package:flutter/material.dart';

const unactiveColor = Color(0xff5c5b69);
const backgroundColor = Color(0xFF1f1d2a);

Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };

  if (states.any(interactiveStates.contains)) {
    return const Color(0xfffffffe);
  } else {
    return unactiveColor;
  }
}
