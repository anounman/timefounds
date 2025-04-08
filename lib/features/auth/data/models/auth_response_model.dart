import 'user_model.dart';

class AuthResponseModel {
  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      sucess: json['success'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
      user: UserModel.fromJson(json['user']),
    );
  }
  AuthResponseModel({
    required this.sucess,
    required this.message,
    required this.token,
    required this.user,
  });
  final bool sucess;
  final String message;
  final String token;
  final UserModel user;
}
