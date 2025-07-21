import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Register")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.appLogoIcn, height: 185),
              SizedBox(height: 24.0),
              CustomTextFormFiled(
                hintText: "Name",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ImageIcon(
                    AssetImage(AppAssets.personIcn),
                    color: ColorPallete.textFormFieldBorderColor,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
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
              SizedBox(height: 16.0),
              CustomTextFormFiled(
                hintText: "Password",
                isPassword: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ImageIcon(
                    AssetImage(AppAssets.passwordIcn),
                    color: ColorPallete.textFormFieldBorderColor,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              CustomTextFormFiled(
                hintText: "Re-Password",
                isPassword: true,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ImageIcon(
                    AssetImage(AppAssets.passwordIcn),
                    color: ColorPallete.textFormFieldBorderColor,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              CustomButton(
                onPressed: () {},
                child: Text(
                  "Create Account",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 24.0),
              Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Already Have Account ? ",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: ColorPallete.generalTextColor,
                      ),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Login",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorPallete.primaryColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorPallete.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
