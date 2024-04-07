import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';


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