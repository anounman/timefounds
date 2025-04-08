import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_repository_provider.dart';

class AuthState {
  AuthState({
    this.isAuthenticated = false,
    this.email,
    this.password,
    this.errorMessage,
  });
  final bool isAuthenticated;
  final String? email;
  final String? password;
  final String? errorMessage;

  AuthState copyWith({
    bool? isAuthenticated,
    String? email,
    String? password,
    String? errorMessage,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      email: email ?? this.email,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this._authRepository) : super(AuthState());

  final AuthRepository _authRepository;

  Future<void> login(String email, String password) async {
    final result = await _authRepository.login(
      email: email,
      password: password,
    );
    result.fold(
      (failure) {
        state = state.copyWith(
          isAuthenticated: false,
          errorMessage: failure.message,
        );
        log('[login] login ${state.isAuthenticated} error:${failure.message}');
      },
      (user) {
        state = state.copyWith(
          isAuthenticated: true,
          email: user.email,
          password: password,
        );
        log('[login] login ${state.isAuthenticated}');
      },
    );
  }

  void logout() {
    state = AuthState();
    super.dispose();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});
