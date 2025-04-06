import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../app/core/services/local_storage_service.dart';
import '../../data/datasources/api_client.dart';
import '../../data/datasources/auth_local_datasource.dart';
import '../../data/datasources/auth_remote_datasource.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/repositories/auth_repository.dart';

final sharedPreferencesProvider = Provider.autoDispose<SharedPreferences>((
  ref,
) {
  throw UnimplementedError(
    'SharedPreferences  must be initilized in main.dart',
  );
});

final localStorageProvider = Provider.autoDispose<LocalStorageService>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return LocalStorageService(prefs);
});

final httpClientProvider = Provider.autoDispose<http.Client>((ref) {
  return http.Client();
});

final apiClientProvider = Provider.autoDispose<ApiClient>((ref) {
  return ApiClient(client: ref.watch(httpClientProvider));
});

final authRemoteDateSourceProvider = Provider.autoDispose<AuthRemoteDatasource>(
  (ref) {
    return AuthRemoteDataSourceImpl(apiClient: ref.watch(apiClientProvider));
  },
);

final authLocalDataSourceProvider = Provider.autoDispose<AuthLocalDataSource>((
  ref,
) {
  return AuthLocalDataSourceImpl(ref.watch(localStorageProvider));
});

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    remoteDatasource: ref.watch(authRemoteDateSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});
