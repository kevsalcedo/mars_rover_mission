import 'package:flutter/material.dart';
import 'package:rover_app/config/constants/constants.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTapButton;
  final double size;
  const CustomButton({
    super.key,
    required this.title,
    required this.onTapButton,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: obstacleColor,
        child: InkWell(
          onTap: () => onTapButton(),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(title,
                  style: TextStyle(color: Colors.white, fontSize: size))),
        ),
      ),
    );
  }
}
