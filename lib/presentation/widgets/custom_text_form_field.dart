import 'package:flutter/material.dart';
import 'package:rover_app/config/constants/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String)? onChanged;
  final String? errorMessage;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.errorMessage,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    const borderRadius = Radius.circular(15);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backGroundInputTextColor,
        borderRadius: const BorderRadius.all(borderRadius),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(color: obstacleColor, fontWeight: FontWeight.bold),
        cursorColor: obstacleColor,
        decoration: InputDecoration(
          errorText: errorMessage,
          errorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedErrorBorder: border.copyWith(
              borderSide: const BorderSide(color: Colors.transparent)),
          hintText: exampleHint,
          hintStyle:
              const TextStyle(color: hintColor, fontWeight: FontWeight.bold),
          label: Text(
            lableTitle,
            style: TextStyle(color: obstacleColor, fontWeight: FontWeight.bold),
          ),
          floatingLabelStyle: TextStyle(
            color: Colors.deepOrange[400],
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
