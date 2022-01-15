import 'package:flutter/material.dart' hide ButtonStyle;
import 'button.dart';

Widget primary() => const Button(
      text: 'Button',
    );

Widget secondary() => const Button(
      text: 'Button',
      style: ButtonStyle.secondary,
    );

Widget disabled() => const Button(
      text: 'Button',
      style: ButtonStyle.disabled,
    );
