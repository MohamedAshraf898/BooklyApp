import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorM});
  final String errorM;
  @override
  Widget build(BuildContext context) {
    return Text(errorM, style: Styles.textstyle16);
  }
}
