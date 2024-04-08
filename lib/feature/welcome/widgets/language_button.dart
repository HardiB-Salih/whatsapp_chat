import 'package:flutter/material.dart';
import 'package:whatsapp_chat/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_chat/common/utils/my_colors.dart';

import '../../../common/widgets/custom_icon_button.dart';


/// A custom button widget representing a language selection.
///
/// This button displays the specified [language] text and triggers the [onTap]
/// callback when tapped.
class LanguageButton extends StatelessWidget {
  final String language;

  const LanguageButton({
    super.key,
    required this.language,
  });

  showBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 30,
                decoration: BoxDecoration(
                  color: context.theme.greyColor!.withOpacity(.4),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const SizedBox(width: 20),
                  CustomIconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icons.close,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'App Language',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Divider(
                thickness: .5,
                color: context.theme.greyColor!.withOpacity(.3),
              ),
              RadioListTile(
                value: true,
                groupValue: true,
                onChanged: (value) {},
                activeColor: MyColors.greenDark,
                title: const Text('English'),
                subtitle: Text(
                  "(Phone's language)",
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ),
              RadioListTile(
                value: true,
                groupValue: false,
                onChanged: (value) {},
                activeColor: MyColors.greenDark,
                title: const Text('አማርኛ'),
                subtitle: Text(
                  "Amharic",
                  style: TextStyle(
                    color: context.theme.greyColor,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:  context.theme.langBgColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => showBottomSheet(context),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.langHightlightColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language, color: MyColors.greenDark),
              const SizedBox(width: 10),
              Text(language, style: const TextStyle(
                color: MyColors.greenDark,
              ),),
              const SizedBox(width: 10),
              const Icon(Icons.keyboard_arrow_down, color: MyColors.greenDark),
            ],
          ),
        ),
      ),
    );
  }
}