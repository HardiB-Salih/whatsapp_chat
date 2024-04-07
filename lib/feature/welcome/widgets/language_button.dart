import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_chat/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_chat/common/utils/my_colors.dart';

import '../../../common/utils/my_colors.dart';

/// A custom button widget representing a language selection.
///
/// This button displays the specified [language] text and triggers the [onTap]
/// callback when tapped.
class LanguageButton extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageButton({
    super.key,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: MyColors.backgroundDark,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: MyColors.backgroundDark,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language, color: Color(0xFF00A884)),
              const SizedBox(width: 10),
              Text(language, style: const TextStyle(
                color: MyColors.greenDark,
              ),),
              const SizedBox(width: 10),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF00A884)),
            ],
          ),
        ),
      ),
    );
  }
}