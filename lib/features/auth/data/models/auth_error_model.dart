class AuthErrorModel {
  factory AuthErrorModel.fromJson(Map<String, dynamic> json) {
    return AuthErrorModel(
      sucess: json['success'] ?? '',
      message: json['message'] ?? 'Auth Error',
      error: json['error'] ?? 'Auth Error',
    );
  }
  const AuthErrorModel({
    required this.sucess,
    required this.message,
    required this.error,
  });
  final bool sucess;
  final String message;
  final String error;
}
