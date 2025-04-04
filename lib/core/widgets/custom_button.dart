// ignore_for_file: non_constant_identifier_names

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.background_color,
    required this.font_color,
    this.borderRadius,
    required this.text,
    this.onpressed,
  });
  final String text;
  final Color background_color;
  final Color font_color;
  final BorderRadius? borderRadius;
  final void Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onpressed,
        style: TextButton.styleFrom(
          backgroundColor: background_color,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                  16,
                ),
          ),
        ),
        child: Text(
          text,
          style: Styles.textstyle20.copyWith(
            color: font_color,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
