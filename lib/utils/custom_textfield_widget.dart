// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nb_utils/nb_utils.dart';

import '../config/theme/my_styles.dart';
import '../config/theme/my_theme.dart';

class CustomTextFieldWidget extends StatelessWidget {
  CustomTextFieldWidget(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.textEditingController,
      required this.textFieldType})
      : super(key: key);

  String labelText;
  String hintText;
  TextEditingController textEditingController;
  TextFieldType textFieldType;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      textFieldType: textFieldType,
      controller: textEditingController,
      isValidationRequired: true,
      errorThisFieldRequired: 'This field is required',
      textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15.sp),
      decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: MyStyles.getSecondaryColor(isLightTheme: MyTheme().getThemeIsLight),
          border: const OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent), borderRadius: BorderRadius.circular(10.0)),
          hintText: hintText,
          labelText: labelText),
    );
  }
}
