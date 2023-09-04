// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:noventa_oito/utils/default_colors.dart';
import 'package:noventa_oito/utils/text_styles.dart';

enum SizeWidget { mini, small, medium, large }

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  final BoxFit? fit;
  final bool isDisabled;
  final String textButton;
  final Color? colorButton;
  final SizeWidget sizeButton;
  final void Function()? onTap;

  PrimaryButton({
    Key? key,
    this.fit,
    this.colorButton,
    this.isDisabled = false,
    required this.onTap,
    required this.textButton,
    required this.sizeButton,
  }) : super(key: key);

  EdgeInsets? _padding;
  TextStyle? _style;

  buttonConstraints() {
    if (sizeButton == SizeWidget.large) {
      _padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 32);
      _style = CustomTextStyles.labelMedium.copyWith(
        color: DefaultColors.white,
      );
    } else if (sizeButton == SizeWidget.medium) {
      _padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 32);
      _style = CustomTextStyles.labelMedium.copyWith(
        color: DefaultColors.white,
      );
    } else if (sizeButton == SizeWidget.small) {
      _padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 24);
      _style = CustomTextStyles.labelSmall.copyWith(
        color: DefaultColors.white,
      );
    }  else if (sizeButton == SizeWidget.mini) {
      _padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 10);
      _style = CustomTextStyles.labelSmall.copyWith(
        color: DefaultColors.white,
      );
    }else {
      _padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 32);
      _style = CustomTextStyles.labelMedium.copyWith(
        color: DefaultColors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    buttonConstraints();
    return ElevatedButton(
      onPressed: isDisabled == false ? onTap : null,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: DefaultColors.primaryTheme,
        disabledBackgroundColor: DefaultColors.primaryTheme[200],
        disabledForegroundColor: DefaultColors.primaryTheme,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Padding(
        padding: _padding!,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: FittedBox(
                  fit: fit ?? BoxFit.scaleDown,
                  child: Text(
                    textButton,
                    style: _style,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
