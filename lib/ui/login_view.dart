import 'package:flutter/material.dart';
import 'package:harbor/services/login_services.dart';
import 'package:harbor/ui/home_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginService _loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MyFooterButtonWidget(
          emailController: _emailController,
          passwordController: _passwordController,
          loginService: _loginService,
        ),
        backgroundColor: Color(0xff1B262C),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Welcome",
                style: TextStyle(
                    color: Color(0xffF5F8FB),
                    fontSize: 34,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Please enter your data to continue",
                style: TextStyle(
                    color: Color(0xff8F959E),
                    fontWeight: FontWeight.w400,
                    fontSize: 19),
              ),
            ),
            SizedBox(
              height: 160,
            ),
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 16.0),
                      Text(
                        'Email',
                        style:
                            TextStyle(color: Color(0xff8F959E), fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            20.0), // Adjust the horizontal padding as needed
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Color.fromARGB(255, 208, 209, 211),
                      style: TextStyle(
                        color: Color.fromARGB(255, 208, 209, 211),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 208, 209, 211),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 209, 211),
                              width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 209, 211),
                              width: 1.0),
                        ),
                        suffixIcon: Icon(
                          Icons
                              .check, // You can change this to any icon you want
                          color: Color(0xff34C358),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      SizedBox(width: 16.0),
                      Text(
                        'Password',
                        style:
                            TextStyle(color: Color(0xff8F959E), fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: Color.fromARGB(255, 208, 209, 211),
                      style: TextStyle(
                          color: Color.fromARGB(255, 208, 209, 211),
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 209, 211),
                              width: 1.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 208, 209, 211),
                              width: 1.0),
                        ),
                        suffixIcon: Icon(
                          Icons
                              .lock, // You can change this to any icon you want
                          color: Color(0xff34C358),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xffE96459)),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 30,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Don't Have An Account?",
                      style: TextStyle(color: Color(0xff8F959E)),
                    )),
              ],
            ),
          ],
        ));
  }
}

class MyFooterButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginService loginService;

  MyFooterButtonWidget({
    required this.emailController,
    required this.passwordController,
    required this.loginService,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // Access the values entered by the user
        String email = emailController.text;
        String password = passwordController.text;

        // Call the login service to perform login
        Map<String, dynamic> response =
            await loginService.login(email, password);

        // Check if login was successful
        if (response.containsKey('success') && response['success'] == true) {
          // If login is successful, navigate to HomeView and pass user's name
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(userName: response['userName']),
            ),
          );
        } else {
          // If login fails, display an error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Login Failed"),
                content: Text(response['message'] ?? "An error occurred."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        height: 90.0, // Set the height of the fixed footer
        color: Color(0xff9775FA), // Set the color of the fixed footer
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(color: Color(0xffF5F8FB), fontSize: 20),
          ),
        ),
      ),
    );
  }
}
