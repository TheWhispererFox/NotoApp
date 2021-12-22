import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle? {
  TextStyle? get thin => this?.copyWith(fontWeight: FontWeight.w100);
  TextStyle? get extraLight => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? get light => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get regular => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get medium => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get semibold => this?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get bold => this?.copyWith(fontWeight: FontWeight.w700);
  TextStyle? get extraBold => this?.copyWith(fontWeight: FontWeight.w800);
  TextStyle? get black => this?.copyWith(fontWeight: FontWeight.w900);

  TextStyle? get w100 => this?.copyWith(fontWeight: FontWeight.w100);
  TextStyle? get w200 => this?.copyWith(fontWeight: FontWeight.w200);
  TextStyle? get w300 => this?.copyWith(fontWeight: FontWeight.w300);
  TextStyle? get w400 => this?.copyWith(fontWeight: FontWeight.w400);
  TextStyle? get w500 => this?.copyWith(fontWeight: FontWeight.w500);
  TextStyle? get w600 => this?.copyWith(fontWeight: FontWeight.w600);
  TextStyle? get w700 => this?.copyWith(fontWeight: FontWeight.w700);
  TextStyle? get w800 => this?.copyWith(fontWeight: FontWeight.w800);
  TextStyle? get w900 => this?.copyWith(fontWeight: FontWeight.w900);

  TextStyle? get italic => this?.copyWith(fontStyle: FontStyle.italic);
  TextStyle? get normal => this?.copyWith(fontStyle: FontStyle.normal);

  TextStyle? opacity(double opacity) =>
      this?.copyWith(color: (this?.color ?? Colors.black).withOpacity(opacity));
  TextStyle? size(double size) => this?.copyWith(fontSize: size);
  TextStyle? fontColor(Color color) => this?.copyWith(color: color);
  TextStyle? fontOverflow(TextOverflow textOverflow) =>
      this?.copyWith(overflow: textOverflow);
}
