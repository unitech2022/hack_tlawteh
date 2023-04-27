import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hack_tlawateh/core/widgets/texts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../helpers/sizing.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({super.key, required this.btnController, required this.onPress, required this.height, required this.title, required this.backgroundColor, required this.textColor});

  final RoundedLoadingButtonController btnController;

  final void Function() onPress;
  final double height;
  final String title;
  final Color backgroundColor, textColor;
  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
        color: backgroundColor,
        loaderSize: 30,
        loaderStrokeWidth: 3,
        duration: const Duration(milliseconds: 300),
        completionCurve: Curves.ease,
        height:height,
        borderRadius: 8,
        successColor: Colors.green,
        // controller: _btnController,
        onPressed: onPress,
        controller: btnController,
        child: Texts(
          title: title,
          textColor: Colors.white,
          fontSize: padding20,
          weight: FontWeight.normal,
        ));
  }
}
