import 'package:dartz/dartz.dart';

import '../../../../app/core/error/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> singnUp({
    required String email,
    required String password,
  });
  String? getToken();
  bool isLoggedIn();
  Future<void> logout();
}
