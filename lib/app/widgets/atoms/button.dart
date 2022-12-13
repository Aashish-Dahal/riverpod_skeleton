import 'package:flutter/material.dart'
    show
        BorderRadius,
        BorderSide,
        BoxConstraints,
        BuildContext,
        Clip,
        Key,
        RawMaterialButton,
        RoundedRectangleBorder,
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
  final bool? disabled;
  const Button(
      {Key? key,
      this.type = ButtonType.filled,
      required this.label,
      this.constraints,
      this.disabled = false,
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
        child: Text(
          label,
          style: Theme.of(context).textTheme.button,
        ));
  }
}
