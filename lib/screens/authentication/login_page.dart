import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/widgets/headline.dart';
import 'local_widget/button_to_register.dart';
import 'local_widget/login_field.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  static final String id = 'login_page';
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 10, 40.0, 0),
          width: screenSize.width,
          child: Column(
            children: [
              Headline(
                screenSize: screenSize,
                buttonTap: () {},
                textHeadline: 'Log In',
                buttonText: 'Login With Google',
              ),
              SizedBox(height: screenSize.height / 28),
              LoginField(
                screenSize: screenSize,
                emailController: emailController,
                passwordController: passwordController,
                buttonTap: () {
                  print(emailController.text);
                  print(passwordController.text);
                },
              ),
              SizedBox(height: screenSize.height / 6),
              ButtonToRegister(
                screenSize: screenSize,
                buttonText: 'Create account',
                buttonTap: () {
                  Get.toNamed(RegisterPage.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
