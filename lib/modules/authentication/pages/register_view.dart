import 'package:event_app_c15_mon/core/constants/app_assets.dart';
import 'package:event_app_c15_mon/core/theme/color_pallete.dart';
import 'package:event_app_c15_mon/core/utlis/firebase_authentication_utils.dart';
import 'package:event_app_c15_mon/core/widgets/custom_button.dart';
import 'package:event_app_c15_mon/core/widgets/custom_text_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.appLogoIcn, height: 185),
                SizedBox(height: 24.0),
                CustomTextFormFiled(
                  controller: _nameController,
                  hintText: "Name",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
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
                  controller: _emailController,
                  hintText: "Email",
                  validator: (value) {
                    final emailRegExp = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!emailRegExp.hasMatch(value)) {
                      return 'Please enter a valid email address';
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
                    final passwordRegExp = RegExp(
                      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
                    );
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (!passwordRegExp.hasMatch(value)) {
                      return 'Please enter a valid password';
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
                CustomTextFormFiled(
                  hintText: "Re-Password",
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    if (value != _passwordController.text) {
                      return 'Password does not match';
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
                CustomButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      EasyLoading.show();
                      FirebaseAuthenticationUtils.createUserWithEmailAndPassword(
                        emailAddress: _emailController.text,
                        password: _passwordController.text,
                      ).then((value) {
                        EasyLoading.dismiss();
                        if (value) {
                          Navigator.pop(context);
                        }
                      });
                    }
                  },
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
      ),
    );
  }
}
