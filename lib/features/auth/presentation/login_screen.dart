import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../app/core/config/app_color.dart';
import '../../../app/core/config/app_string.dart';
import '../../../app/core/config/assets.dart';
import '../../../app/core/config/custom_text_style.dart';
import '../../../app/core/utils/context_extension.dart';
import '../../shared_widgets/custom_text_field.dart';
import 'provider/form_controller_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          reverse: true,
          child: Padding(
            padding: EdgeInsets.all(context.height * 0.025),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: context.height * 0.03,
              children: [
                Column(children: [_header(), _loginForm()]),
                _loginButton(),
                _resetPassword(),
                _testButton(context.mediaQuerySize),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Image.asset(Assets.logo, fit: BoxFit.fitWidth);
  }

  Widget _loginForm() {
    return Consumer(
      builder: (context, ref, _) {
        final formController = ref.watch(loginFormProvier);
        return Column(
          spacing: context.height * 0.001,
          children: [
            Form(
              key: formController.formKey,
              child: Column(
                spacing: 16,
                children: [
                  _inputTile(
                    icon: LucideIcons.user2,
                    textField: CustomTextField.standerdInput(
                      context: context,
                      hintText: AppString.email,
                      controller: formController.emailController,
                      borderRadius: 10,
                      isNext: true,
                      textInputType: TextInputType.emailAddress,
                      validator: formController.validateEmail,
                    ),
                  ),
                  _inputTile(
                    icon: LucideIcons.lock,
                    textField: CustomTextField.standerdInput(
                      context: context,
                      hintText: AppString.password,
                      suffix: GestureDetector(
                        onTap:
                            () =>
                                ref
                                    .read(loginFormProvier.notifier)
                                    .changePasswordVisibility(),
                        child: Icon(
                          formController.isHidden
                              ? LucideIcons.eye
                              : LucideIcons.eyeOff,
                          color: Colors.grey,
                        ),
                      ),
                      controller: formController.passwordController,
                      borderRadius: 10,
                      textInputType: TextInputType.visiblePassword,
                      isHidden: formController.isHidden,
                      validator: formController.validatePassword,
                      onSubmit:
                          (_) =>
                              ref.read(loginFormProvier.notifier).handelLogin(),
                    ),
                  ),
                ],
              ),
            ),
            _stayLogin(),
          ],
        );
      },
    );
  }

  Widget _inputTile({required IconData icon, required Widget textField}) {
    return Row(spacing: 8, children: [Icon(icon), Expanded(child: textField)]);
  }

  Widget _loginButton() {
    return Consumer(
      builder: (context, ref, _) {
        final formController = ref.watch(loginFormProvier);
        return Center(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              ref.read(loginFormProvier.notifier).handelLogin();
            },
            child: Container(
              constraints: BoxConstraints(
                maxHeight: context.height * 0.06,
                maxWidth: context.width * 0.45,
              ),
              decoration: BoxDecoration(color: AppColor.buttonBg),
              child: Center(
                child:
                    formController.isLoading
                        ? CircularProgressIndicator(color: AppColor.progressBar)
                        : Text(
                          AppString.login,
                          style: CustomTextStyle.regularText.copyWith(
                            color: AppColor.buttonText,
                          ),
                        ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _stayLogin() {
    return Consumer(
      builder: (context, ref, _) {
        bool isChecked = ref.watch(loginFormProvier).isPresisted;
        return Padding(
          padding: EdgeInsets.only(left: context.height * 0.025),
          child: Row(
            children: [
              Checkbox(
                checkColor: AppColor.activeCheck,
                fillColor: WidgetStateProperty.all(
                  AppColor.checkBoxBg(isChecked),
                ),
                value: isChecked,
                onChanged: (value) {
                  ref.read(loginFormProvier.notifier).setPresisted(value!);
                },
              ),
              Text(
                AppString.stayLoggedIn,
                style: CustomTextStyle.regularText.copyWith(
                  color: AppColor.regularText,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _resetPassword() {
    return Text(
      AppString.resetPassword,
      style: CustomTextStyle.restPasswordText,
    );
  }

  Widget _testButton(Size deviceSize) {
    return Column(
      spacing: deviceSize.height * 0.035,
      children: [
        Text(
          AppString.testNow,
          style: CustomTextStyle.regularText.copyWith(
            color: AppColor.regularText,
            fontSize: 18,
          ),
        ),
        Container(
          width: deviceSize.width * 0.8,
          decoration: BoxDecoration(
            color: AppColor.testButtonBg,
            border: Border.all(width: 3),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: deviceSize.height * 0.01,
              bottom: deviceSize.height * 0.01,
            ),
            child: Center(
              child: Text(
                AppString.startTest,
                style: CustomTextStyle.testButtonText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
