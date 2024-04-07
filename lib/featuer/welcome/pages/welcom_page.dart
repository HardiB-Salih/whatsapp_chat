import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0XFF111B21),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Image.asset('assets/images/circle.png',
                  color: const Color(0xFF00A884),),
              )
          ),
          const SizedBox(height: 40),
          Expanded(child: Column(
            children: [
              const Text("Welcome to Whatsapp",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
               Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: PrivacyWidget(onPrivacyPolicyTap: () {},),
              ),
              CustomElevatedButton(title: "AGREE AND CONTINUE", onPressed: () {},),
              const SizedBox(height: 50),
              LanguageWidget(language: "English", onTap: () {})
            ],
          )),
        ],
      )
    );
  }
}


class LanguageWidget extends StatelessWidget {
  final String language;
  final VoidCallback onTap;

  const LanguageWidget({
    super.key,
    required this.language,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF182229),
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: const Color(0xFF09141A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.language, color: Color(0xFF00A884)),
              const SizedBox(width: 10),
              Text(language),
              const SizedBox(width: 10),
              const Icon(Icons.keyboard_arrow_down, color: Color(0xFF00A884)),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomElevatedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: MediaQuery.of(context).size.width - 100,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF00A884),
          foregroundColor: const Color(0xFF111B21),
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Set border radius here
          ),
        ),
        child: Text(title),
      ),
    );
  }
}


/// A custom widget for displaying privacy-related text with clickable links.
///
/// This widget renders rich text that includes links for "Privacy Policy" and "Terms of Services".
/// Tapping on these links triggers specific callback functions provided via [onPrivacyPolicyTap] and [onTermsOfServiceTap].
class PrivacyWidget extends StatelessWidget {
  final VoidCallback? onPrivacyPolicyTap;
  final VoidCallback? onTermsOfServiceTap;

  const PrivacyWidget({
    super.key,
    this.onPrivacyPolicyTap,
    this.onTermsOfServiceTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Read our ',
        style: const TextStyle(
          color: Color(0xFF869680),
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: 'Privacy Policy. ',
            style: const TextStyle(
              color: Color(0xFF53BDAB),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onPrivacyPolicyTap ?? () {}, // Trigger onTap function or do nothing
          ),
          const TextSpan(text: 'Tap "Agree and continue" to accept the '),
          TextSpan(
            text: 'Terms of Services.',
            style: const TextStyle(
              color: Color(0xFF53BDAB),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = onTermsOfServiceTap ?? () {}, // Trigger onTap function or do nothing
          ),
        ],
      ),
    );
  }
}
