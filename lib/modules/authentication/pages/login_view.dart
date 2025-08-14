import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_authentication_utils.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.appLogoIcn, height: 185),
                  SizedBox(height: 24.0),
                  CustomTextFormFiled(
                    controller: _emailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
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
                    controller: _passwordController,
                    hintText: "Password",
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
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
                      Navigator.pushNamed(
                        context,
                        PageRoutesName.forgetPassword,
                      );
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
                      if (_formKey.currentState!.validate()) {
                        EasyLoading.show();
                        FirebaseAuthenticationUtils.signInWithEmailAndPassword(
                          emailAddress: _emailController.text,
                          password: _passwordController.text,
                        ).then((value) {
                          EasyLoading.dismiss();
                          if (value) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              PageRoutesName.layout,
                                  (route) => false,
                            );
                          }
                        },);
                      }

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
                      Expanded(
                        child: Divider(color: ColorPallete.primaryColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Or",
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: ColorPallete.primaryColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(color: ColorPallete.primaryColor),
                      ),
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
      ),
    );
  }
}
