import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class CustomTextFormFiled extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;
  final bool isPassword;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    super.key,
    this.hintText,
    this.controller,
    this.prefixIcon,
    this.maxLines = 1,
    this.minLines,
    this.validator,
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
      controller: widget.controller,
      obscureText: widget.isPassword ? obscureText : false,
      // true
      cursorColor: ColorPallete.textFormFieldBorderColor,
      style: theme.textTheme.titleSmall,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      validator: widget.validator,
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
