import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.sizeOf(this);
  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
}
