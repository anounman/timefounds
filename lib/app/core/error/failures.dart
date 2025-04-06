import '../config/app_string.dart';

abstract class Failure {
  const Failure({this.message = AppString.error});

  final String message;
}

class LoginFailure extends Failure {
  LoginFailure({required super.message});
}

class SingUpFailure extends Failure {
  SingUpFailure({required super.message});
}
