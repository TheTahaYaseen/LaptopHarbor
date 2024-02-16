import 'package:harbor/api_client/api_client.dart';

class RegisterService {
  final ApiClient _apiClient = ApiClient();

  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    try {
      // Register the user using the API client
      final Map<String, dynamic> response =
          await _apiClient.register(email, username, password);

      // If registration is successful, extract the username from the response
      // and return it along with the success flag
      if (response.containsKey('success') && response['success']) {
        final String userName = response['userName'];
        return {'success': true, 'userName': userName};
      } else {
        // If registration fails, return the response as it is
        return response;
      }
    } catch (e) {
      // If an error occurs during registration, throw it
      throw e;
    }
  }
}
