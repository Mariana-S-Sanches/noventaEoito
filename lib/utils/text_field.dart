// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/default_colors.dart';

class CustomTextFields extends StatelessWidget {
  int? maxLength;
  Widget? suffixIcon;
  void Function()? onPressedSuffixIcon;

  String? hintText;
  final String labelText;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;

  final TextStyle? textStyle;
  final InputDecoration? inputDecoration;
  final AutovalidateMode? autoValidateMode;

  final Key? textFieldKey;
  final FocusNode? focusNode;

  final bool clearButton;
  final bool isAmex;
  final bool autoFocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final int? maxLines;
  final bool? enabled;

  CustomTextFields({
    Key? key,
    this.onTap,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.textStyle,
    this.focusNode,
    this.suffixIcon,
    this.textFieldKey,
    this.isAmex = false,
    this.inputDecoration,
    this.autoValidateMode,
    this.autoFocus = false,
    this.autocorrect = true,
    this.clearButton = false,
    this.onPressedSuffixIcon,
    this.enableSuggestions = true,
    this.enabled,
    required this.labelText,
    required this.controller,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: DefaultColors.primaryTheme),
      child: TextFormField(
        maxLines: maxLines,
        key: textFieldKey,
        onTap: onTap,
        cursorColor: DefaultColors.primaryTheme,
        onChanged: onChanged ?? (_) {},
        maxLength: maxLength ?? 50,
        controller: controller,
        autovalidateMode: autoValidateMode ?? AutovalidateMode.onUserInteraction,
        validator: validator ?? (_) => null,
        keyboardType: TextInputType.multiline,
        style: textStyle ?? CustomTextStyles.labelSmall,
        focusNode: focusNode,
        autofocus: autoFocus,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        decoration: inputDecoration ??
            InputDecoration(
              enabled: enabled ?? true,
              counterText: '',
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: DefaultColors.red,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              hintText: labelText,
              labelStyle: CustomTextStyles.labelSmall,
            ),
      ),
    );
  }
}
