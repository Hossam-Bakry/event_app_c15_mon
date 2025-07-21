import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Forget Password")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              AppAssets.forgetPasswordImg,
              height: mediaQuery.size.height * 0.38,
            ),
            SizedBox(height: 24.0),
            CustomTextFormFiled(
              hintText: "Email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ImageIcon(
                  AssetImage(AppAssets.mailIcn),
                  color: ColorPallete.textFormFieldBorderColor,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            CustomButton(
              backgroundColor: ColorPallete.primaryColor,
              child: Text(
                "Reset Password",
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
