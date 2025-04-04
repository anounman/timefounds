import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../app/core/config/app_string.dart';
import 'auth_provider.dart';

class LoginFromState {
  LoginFromState({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.isHidden,
    this.isLoading = false,
    this.isValid = false,
    this.isPresisted = false,
  });
  LoginFromState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isHidden,
    bool? isLoading,
    bool? isValid,
    bool? isPresisted,
  }) => LoginFromState(
    formKey: formKey,
    emailController: emailController ?? this.emailController,
    passwordController: passwordController ?? this.passwordController,
    isHidden: isHidden ?? this.isHidden,
    isLoading: isLoading ?? this.isLoading,
    isValid: isValid ?? this.isValid,
    isPresisted: isPresisted ?? this.isPresisted,
  );

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isHidden;
  final bool isLoading;
  final bool isValid;
  final bool isPresisted;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) { 
      return AppString.emailEmptyError;
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return AppString.emailError;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.passwordError;
    }

    if (value.length < 6) {
      return AppString.passwordLengthError;
    }

    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}

class LoginFormControllerNotifier extends StateNotifier<LoginFromState> {
  LoginFormControllerNotifier(this.ref)
    : super(
        LoginFromState(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          isHidden: true,
          formKey: GlobalKey<FormState>(),
        ),
      );
  final Ref ref;
  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }

  void clear() {
    state.emailController.clear();
    state.passwordController.clear();
  }

  void setEmail(String email) {
    state.emailController.text = email;
  }

  void setPassword(String password) {
    state.passwordController.text = password;
  }

  void changePasswordVisibility() {
    state = state.copyWith(isHidden: !state.isHidden);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setValid(bool valid) {
    state = state.copyWith(isValid: valid);
  }

  void setPresisted(bool presisted) {
    state = state.copyWith(isPresisted: presisted);
  }

  bool validate() {
    final isValid = state.formKey.currentState?.validate() ?? false;
    state = state.copyWith(isValid: isValid);
    return isValid;
  }

  Future<void> handelLogin() async {
    if (validate()) {
      state = state.copyWith(isLoading: true);
      try {
        await ref
            .read(authProvider.notifier)
            .login(state.emailController.text, state.passwordController.text);
      } catch (e) {
        state = state.copyWith(isLoading: false);
        log('[FormControllerNotifier] Login Error: $e');
      } finally {
        state = state.copyWith(isLoading: false);
      }
    }
  }
}

final loginFormProvier = StateNotifierProvider.autoDispose<
  LoginFormControllerNotifier,
  LoginFromState
>((ref) => LoginFormControllerNotifier(ref));
