import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomTextFormFiled extends StatefulWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;

  const CustomTextFormFiled({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.isPassword = false,
  });

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      ///          true               true
      obscureText: widget.isPassword ? obscureText : false, // true
      cursorColor: ColorPallete.textFormFieldBorderColor,
      style: theme.textTheme.titleSmall,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: theme.textTheme.titleSmall,
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.isPassword
                ? Bounceable(
                  onTap: () {
                    setState(() {
                      //
                      obscureText = !obscureText; // true
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: ColorPallete.textFormFieldBorderColor,
                  ),
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.textFormFieldBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.textFormFieldBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: ColorPallete.textFormFieldBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(
            color: ColorPallete.textFormFieldBorderErrorColor,
          ),
        ),
      ),
    );
  }
}
