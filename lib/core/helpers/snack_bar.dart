import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

void snackBar(BuildContext context, String message) {
  Flushbar(
    message: message,
    duration: const Duration(seconds: 2),
    margin: const EdgeInsets.all(16),
    borderRadius: BorderRadius.circular(100),
    animationDuration: const Duration(milliseconds: 500),
    forwardAnimationCurve: Curves.easeIn,
    reverseAnimationCurve: Curves.easeOut,
  ).show(context);
}
