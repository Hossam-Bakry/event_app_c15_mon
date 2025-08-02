import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? backgroundColor;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 14.0),
        backgroundColor: backgroundColor ?? ColorPallete.primaryColor,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: ColorPallete.primaryColor),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      child: child,
    );
  }
}
