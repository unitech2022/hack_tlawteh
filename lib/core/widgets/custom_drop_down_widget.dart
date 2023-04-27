import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hack_tlawateh/core/helpers/sizing.dart';

import '../data/data.dart';

class CustomDropDownWidget extends StatelessWidget {
  final List<AddressModel> list;
  final void Function(dynamic)? onChanged;
  final String hint;
  final bool isTwoIcons;

  final Color iconColor, textColor;
  final AddressModel? currentValue;
  final bool selectCar;

  const CustomDropDownWidget(
      {this.selectCar = false,
      required this.currentValue,
      required this.textColor,
      required this.iconColor,
      this.isTwoIcons = false,
      required this.list,
      required this.onChanged,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: list
            .map((item) => DropdownMenuItem<dynamic>(
                value: item,
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: padding20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontFamily: ""),
                  overflow: TextOverflow.ellipsis,
                )))
            .toList(),
        value: currentValue,
        onChanged: onChanged,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.black,
        ),
        iconSize: 18,
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: double.infinity,
        buttonDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: padding20,
            fontWeight: FontWeight.normal,
            fontFamily: '',
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class CustomDropDownDynamicWidget extends StatelessWidget {
  final List<dynamic> list;
  final void Function(dynamic)? onChanged;
  final String hint;
  final bool isTwoIcons;
 final List<DropdownMenuItem<dynamic>> listWidget;
  final Color iconColor, textColor;
  final dynamic currentValue;
  final bool selectCar;

  const CustomDropDownDynamicWidget(
      {this.selectCar = false,
      required this.currentValue,
      required this.textColor,
      required this.listWidget,
      required this.iconColor,
      this.isTwoIcons = false,
      required this.list,
      required this.onChanged,
      required this.hint});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        items: listWidget,
        value: currentValue,
        onChanged: onChanged,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.black,
        ),
        iconSize: 18,
        iconEnabledColor: Colors.white,
        iconDisabledColor: Colors.grey,
        buttonHeight: 50,
        buttonWidth: double.infinity,
        buttonDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight:null,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(40),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(-20, 0),
        hint: Text(
          hint,
          style: TextStyle(
            fontSize: padding20,
            fontWeight: FontWeight.normal,
            fontFamily: '',
            color: Colors.black.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}
