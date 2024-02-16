import 'package:harbor/services/login_services.dart';
import 'package:stacked/stacked.dart';

class LoginViewModel extends BaseViewModel {
  final _loginService = LoginService();

  bool isLoading = false;
  bool isLoggedIn = false;
  String errorMessage = '';

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _loginService.login(email, password);

      // Check if login was successful
      if (response['success']) {
        // If successful, handle the success case here
        isLoggedIn = true;
        print('Login Successful');
      } else {
        // If login failed, set error message
        errorMessage = response['message'];
        print('Login Failed: $errorMessage');
      }
    } catch (e) {
      // If an error occurs during login process
      errorMessage = 'Error: $e';
      print(errorMessage);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
