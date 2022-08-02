import 'package:flutter/material.dart';

extension PaddingEx on Widget {
  Widget setPadding({
    double left = 25,
    double top = 0,
    double right = 25,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(left, top, right, bottom),
        child: this,
      );
}
