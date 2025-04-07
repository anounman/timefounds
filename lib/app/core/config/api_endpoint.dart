abstract class ApiEndpoint {
  ApiEndpoint._();
  static String baseUrl = 'http://192.168.0.108:3000/';
  static String health = '${baseUrl}api/engine/';
  static String login = '${baseUrl}api/auth/login';
  static String signup = '${baseUrl}api/auth/signup';
}
