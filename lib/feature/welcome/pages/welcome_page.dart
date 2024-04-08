import 'package:flutter/material.dart';
import 'package:whatsapp_chat/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_chat/feature/welcome/widgets/language_button.dart';

import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  child: Image.asset('assets/images/circle.png',
                    color: context.theme.circleImageColor),
                ),
              )
          ),
          const SizedBox(height: 40),
          Expanded(child: Column(
            children: [
              const Text("Welcome to Whatsapp",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: PrivacyWidget(onPrivacyPolicyTap: () {},),
              ),
              CustomElevatedButton(title: "AGREE AND CONTINUE", onPressed: () {},),
              const SizedBox(height: 50),
              const LanguageButton(language: "English")
            ],
          )),
        ],
      )
    );
  }
}





