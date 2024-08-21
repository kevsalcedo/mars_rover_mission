import 'package:flutter/material.dart';

import 'package:rover_app/config/constants/constants.dart';
import 'package:rover_app/presentation/widgets/widget.dart';

class InitView extends StatelessWidget {
  final Function onTapButton;
  const InitView({super.key, required this.onTapButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          welcomeMessage,
          style: TextStyle(
              color: obstacleColor, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(rulesTitle, style: TextStyle(fontSize: 22)),
        const RuleText(title: ruleOne),
        const RuleText(title: ruleTwo),
        const RuleText(title: ruleThree),
        const RuleText(title: ruleFour),
        const RuleText(title: ruleFive),
        const SizedBox(height: 20),
        CustomButton(title: initButton, onTapButton: () => onTapButton())
      ],
    );
  }
}

class RuleText extends StatelessWidget {
  final String title;
  const RuleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check),
        Text(title, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
