import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_tlawateh/core/helpers/sizing.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hint,
    required this.controller, required this.type,
  });
  final String hint;
  final TextEditingController controller;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.grey,
      style:  TextStyle(
        fontSize: padding20,
        fontFamily: "t",
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      keyboardType: type,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: padding15,
          fontWeight: FontWeight.normal,
          color: Colors.black.withOpacity(.4),
        ),
        border: InputBorder.none,

        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: Color(0xffDBDBDB),
        // )
      ),
    );
  }
}
