import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  AuthState({this.isAuthenticated = false, this.email, this.password});
  final bool isAuthenticated;
  final String? email;
  final String? password;

  AuthState copyWith({bool? isAuthenticated, String? email , String? password}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    state = state.copyWith(isAuthenticated: true, email: email , password: password);
  }

  void logout() {
    state = AuthState();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
