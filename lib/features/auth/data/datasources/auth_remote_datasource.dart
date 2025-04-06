import '../../../../app/core/config/api_endpoint.dart';
import '../models/auth_error_model.dart';
import '../models/auth_request_model.dart';
import '../models/auth_response_model.dart';
import 'api_client.dart';

abstract class AuthRemoteDatasource {
  Future<AuthResponseModel> login(String email, String password);
  Future<AuthResponseModel> signup(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  AuthRemoteDataSourceImpl({required this.apiClient});
  final ApiClient apiClient;

  @override
  Future<AuthResponseModel> signup(String email, String password) async {
    final response = await apiClient.post(
      ApiEndpoint.signup,
      AuthRequestModel(email: email, password: password).toJson(),
    );

    if (response.statusCode == 201) {
      return AuthResponseModel.fromJson(response.data);
    } else {
      throw Exception(AuthErrorModel.fromJson(response.data));
    }
  }

  @override
  Future<AuthResponseModel> login(String email, String password) async {
    final response = await apiClient.post(
      ApiEndpoint.login,
      AuthRequestModel(email: email, password: password).toJson(),
    );  

    if (response.statusCode == 200) {
      return AuthResponseModel.fromJson(response.data);
    } else {
      throw Exception(AuthErrorModel.fromJson(response.data));
    }
  }
}
