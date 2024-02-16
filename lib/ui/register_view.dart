import 'package:flutter/material.dart';
import 'package:harbor/ui/home_view.dart';
import 'package:harbor/ui/login_view.dart';
import 'package:harbor/ui/register_viewmodel.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final RegisterViewModel _viewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(_viewModelListener);
  }

  @override
  void dispose() {
    _viewModel.removeListener(_viewModelListener);
    super.dispose();
  }

  void _viewModelListener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyFooterButtonWidget(
        nameController: _nameController,
        passwordController: _passwordController,
        emailController: _emailController,
        viewModel: _viewModel,
      ),
      backgroundColor: Color(0xff1B262C),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 5.0,
                ),
                CircleIconButton(
                  icon: Icons.arrow_back,
                  iconColor: Color(0xffF5F8FB),
                  circleColor: Color(0xff222E34),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xffF5F8FB),
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 50), // Adjust as needed for spacing
              ],
            ),
            SizedBox(
              height: 10,
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
                        'Username',
                        style:
                            TextStyle(color: Color(0xff8F959E), fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _nameController,
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
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 209, 211),
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.check,
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
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 209, 211),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 209, 211),
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.lock,
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
                        'Email',
                        style:
                            TextStyle(color: Color(0xff8F959E), fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: Color.fromARGB(255, 208, 209, 211),
                      style: TextStyle(
                        color: Color.fromARGB(255, 208, 209, 211),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 209, 211),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 208, 209, 211),
                            width: 1.0,
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.email,
                          color: Color(0xff34C358),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 30),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Already Have An Account?",
                    style: TextStyle(color: Color(0xff8F959E)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyFooterButtonWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final RegisterViewModel viewModel;

  MyFooterButtonWidget({
    required this.nameController,
    required this.passwordController,
    required this.emailController,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        String name = nameController.text;
        String password = passwordController.text;
        String email = emailController.text;

        // Call the register method from RegisterViewModel
        Map<String, dynamic> registrationResponse =
            await viewModel.register(email, name, password);

        if (registrationResponse.containsKey('success') &&
            registrationResponse['success']) {
          // Extract the username from the response
          String userName = registrationResponse['userName'];

          // Navigate to the home page and pass the username
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(userName: userName),
            ),
          );
        } else {
          // Show a dialog box if registration fails
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Registration Failed"),
                content: Text(registrationResponse['message'] ??
                    "An error occurred during registration."),
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
        height: 90.0,
        color: Color(0xff9775FA),
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(color: Color(0xffF5F8FB), fontSize: 20),
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color circleColor;
  final VoidCallback onPressed;

  const CircleIconButton({
    required this.icon,
    required this.iconColor,
    required this.circleColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: circleColor,
        ),
        padding: EdgeInsets.all(10),
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
