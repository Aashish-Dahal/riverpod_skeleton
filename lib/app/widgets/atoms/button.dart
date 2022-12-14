import 'package:flutter/material.dart'
    show
        AlwaysStoppedAnimation,
        BorderRadius,
        BorderSide,
        BoxConstraints,
        BuildContext,
        CircularProgressIndicator,
        Clip,
        Color,
        Key,
        RawMaterialButton,
        RoundedRectangleBorder,
        SizedBox,
        StatelessWidget,
        Text,
        Theme,
        VoidCallback,
        Widget;
import '../../core/utils/app_colors.dart' show AppColors;

enum ButtonType {
  filled,
  outlined,
}

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final BoxConstraints? constraints;
  final bool isCancel;
  final ButtonType? type;
  final bool loading;
  final bool? disabled;
  const Button(
      {Key? key,
      this.type = ButtonType.filled,
      required this.label,
      this.constraints,
      this.disabled = false,
      this.loading = false,
      required this.onPressed,
      this.isCancel = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        onPressed: disabled! ? null : onPressed,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        clipBehavior: Clip.antiAlias,
        constraints: constraints ??
            const BoxConstraints(minWidth: double.infinity, minHeight: 45),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: type == ButtonType.filled
                ? BorderSide.none
                : const BorderSide(color: AppColors.purple, width: 1)),
        fillColor: disabled!
            ? type == ButtonType.filled
                ? AppColors.purple.withOpacity(.5)
                : null
            : type == ButtonType.filled
                ? AppColors.purple
                : null,
        child: loading
            ? const SizedBox(
                height: 25,
                width: 25,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                ),
              )
            : disabled!
                ? null
                : Text(
                    label,
                    style: Theme.of(context).textTheme.button,
                  ));
  }
}
