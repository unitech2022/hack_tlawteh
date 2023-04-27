import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_tlawateh/core/widgets/texts.dart';

import '../helpers/sizing.dart';
import '../styles/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPress,
    required this.height,
    required this.title, required this.backgroundColor, required this.textColor, required this.width,
  });
  final void Function() onPress;
  final double height,width;
  final String title;
  final Color backgroundColor, textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPress,
        child: Texts(
          title: title,
          textColor:textColor,
          fontSize: padding20,
          weight: FontWeight.normal,
        ),
      ),
    );
  }
}
