import 'package:harbor/api_client/api_client.dart';

class LoginService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      // Call the login API
      final Map<String, dynamic> response =
          await _apiClient.login(email, password);

      // Extract user's name from the response
      final String userName = response['userName'];

      // Return the login response along with the username
      return {'success': true, 'userName': userName};
    } catch (e) {
      // If an error occurs during login, throw it
      throw e;
    }
  }
}
