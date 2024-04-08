import 'package:flutter/material.dart';

import '../utils/my_colors.dart';

/// A custom button widget with elevated style.
///
/// This widget displays an elevated button with the specified [title] text and triggers
/// the [onPressed] callback when pressed.
class CustomElevatedButton extends StatelessWidget {
  final double? buttonWidth;
  final String title;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.buttonWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Set border radius here
          ),
        ),
        child: Text(title),
      ),
    );
  }
}