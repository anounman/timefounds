import 'dart:convert';

import '../../../../app/core/config/storage_key.dart';
import '../../../../app/core/services/local_storage_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<void> saveUser(UserModel user, String token);
  UserModel? getUser();
  String? getToken();
  Future<void> logout();
  bool isLoggedIn();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._storageService);
  final LocalStorageService _storageService;

  @override
  Future<void> logout() async {
    await _storageService.clearAll();
  }

  @override
  String? getToken() {
    return _storageService.getString(StorageKey.tokenKey);
  }

  @override
  UserModel? getUser() {
    final userJson = _storageService.getString(StorageKey.userKey);
    if (userJson != null) {
      return UserModel.fromJson(json.decode(userJson));
    }
    return null;
  }

  @override
  Future<void> saveUser(UserModel user, String token) async {
    await _storageService.setString(
      StorageKey.userKey,
      json.encode(user.toJson()),
    );
    await _storageService.setString(StorageKey.tokenKey, token);
  }

  @override
  bool isLoggedIn() {
    final token = _storageService.getString(StorageKey.tokenKey);
    return token != null && token.isNotEmpty;
  }
}
