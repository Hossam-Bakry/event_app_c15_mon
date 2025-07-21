import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.appLogoIcn, height: 185),
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRoutesName.forgetPassword);
                  },
                  child: Text(
                    "Forget Password?",
                    textAlign: TextAlign.end,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: ColorPallete.primaryColor,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorPallete.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                CustomButton(
                  onPressed: () {
                    /// TODO: navigate to home page
                  },
                  child: Text(
                    "Login",
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
                        text: "Don't have an account? ",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: ColorPallete.generalTextColor,
                        ),
                      ),
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              PageRoutesName.register,
                            );
                          },
                          child: Text(
                            "Create Account",
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
                SizedBox(height: 24.0),
                Row(
                  children: [
                    Expanded(child: Divider(color: ColorPallete.primaryColor)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or",
                        style: theme.textTheme.titleSmall?.copyWith(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: ColorPallete.primaryColor)),
                  ],
                ),
                SizedBox(height: 24.0),
                CustomButton(
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  child: Row(
                    spacing: 8.0,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcn, height: 25),
                      Text(
                        "Login With Google",
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: ColorPallete.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
