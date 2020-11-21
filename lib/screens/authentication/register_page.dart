import 'package:flutter/material.dart';
import 'package:ngabolang/constant/color.dart';
import 'package:ngabolang/widgets/headline.dart';

import 'local_widget/register_field.dart';

class RegisterPage extends StatelessWidget {
  static final String id = 'register_page';
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 10, 40.0, 0),
          child: Column(
            children: [
              Headline(
                screenSize: screenSize,
                buttonTap: () {},
                textHeadline: 'Create account',
                buttonText: 'Register with Google',
              ),
              SizedBox(height: screenSize.height / 28),
              RegisterField(
                nameController: nameController,
                emailController: emailController,
                passwordController: passwordController,
                confirmPasswordController: confirmPasswordController,
                screenSize: screenSize,
                buttonTap: () {
                  print(nameController.text);
                  print(emailController.text);
                  print(passwordController.text);
                  print(confirmPasswordController.text);
                },
              ),
              SizedBox(height: screenSize.height / 7),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    SizedBox(width: 7.0),
                    Text(
                      'Log in',
                      style: TextStyle(
                        color: buttonBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
