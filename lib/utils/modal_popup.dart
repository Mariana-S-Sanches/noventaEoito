// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/text_styles.dart';
import 'package:noventa_oito/utils/primary_button.dart';
import 'package:noventa_oito/utils/secondary_button.dart';

SimpleDialogModalTwoButtons(
  BuildContext context, {
  String? title,
  Function()? onTap,
  Function()? onTapSecondButton,
  required String bodyText,
  required String buttonText,
  required String secondButtonText,
}) {
  showGeneralDialog(
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black26,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(title),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  bodyText,
                  style: CustomTextStyles.bodySmall,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        SizedBox(
          width: double.maxFinite,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: PrimaryButton(
                  onTap: onTap ??
                      () {
                        Navigator.pop(context);
                      },
                  sizeButton: SizeWidget.mini,
                  textButton: buttonText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: SecondaryButton(
                  onTap: onTapSecondButton ??
                      () {
                        Navigator.pop(context);
                      },
                  sizeButton: SizeWidget.mini,
                  textButton: secondButtonText,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

SimpleDialogModalWidget(
  BuildContext context, {
  String? title,
  required Widget body,
  List<Widget>? actions,
}) {
  showGeneralDialog(
    transitionBuilder: (ctx, anim1, anim2, child) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4 * anim1.value, sigmaY: 4 * anim1.value),
      child: FadeTransition(
        opacity: anim1,
        child: child,
      ),
    ),
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black26,
    transitionDuration: const Duration(milliseconds: 200),
    pageBuilder: (ctx, anim1, anim2) => AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      content: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(title),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: body,
              ),
            ],
          ),
        ],
      ),
      actions: actions,
    ),
  );
}
