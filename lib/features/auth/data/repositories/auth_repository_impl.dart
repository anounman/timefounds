import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../app/core/config/app_string.dart';
import '../../../../app/core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_datasource.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/auth_error_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.localDataSource,
  });
  final AuthRemoteDatasource remoteDatasource;
  final AuthLocalDataSource localDataSource;

  @override
  Future<Either<Failure, User>> singnUp({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDatasource.signup(email, password);
      if (response.sucess) {
        await localDataSource.saveUser(response.user, response.token);
        return Right(response.user);
      } else {
        return Left(SingUpFailure(message: AppString.signUpError));
      }
    } catch (e) {
      return Left(SingUpFailure(message: (AppString.signUpError)));
    }
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDatasource.login(email, password);
      log('[auth repo] response ${response.message}');
      if (response.sucess) {
        await localDataSource.saveUser(response.user, response.token);
        return Right(response.user);
      } else {
        return Left(LoginFailure(message: AppString.loginError));
      }
    } on AuthErrorModel catch (e) {
      log('[auth repo] error:${e.error}');
      return Left(LoginFailure(message: (e.message)));
    }
  }

  @override
  Future<void> logout() async {
    await localDataSource.logout();
  }

  @override
  String? getToken() {
    return localDataSource.getToken();
  }

  @override
  bool isLoggedIn() {
    return localDataSource.isLoggedIn();
  }
}
