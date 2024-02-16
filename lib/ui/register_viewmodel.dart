import 'package:harbor/services/register_services.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final RegisterService _registerService = RegisterService();

  Future<Map<String, dynamic>> register(
      String email, String username, String password) async {
    try {
      // Call the register method from RegisterService
      final Map<String, dynamic> response =
          await _registerService.register(email, username, password);

      // If registration is successful, return the response
      if (response.containsKey('success') && response['success']) {
        return response;
      } else {
        // If registration fails, return an appropriate error response
        return {'success': false, 'message': response['message']};
      }
    } catch (e) {
      // If an error occurs during registration, throw it
      throw e;
    }
  }
}
