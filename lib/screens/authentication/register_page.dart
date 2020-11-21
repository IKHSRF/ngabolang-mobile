import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/constant/color.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/services/field_validator.dart';
import 'package:ngabolang/services/firebase_auth.dart';
import 'package:ngabolang/widgets/headline.dart';

import 'local_widget/register_field.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  static final String id = 'register_page';
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String emailValidate = Validator.emailValidate(emailController.text.trim());
    String passwordValidate = Validator.passwordValidate(passwordController.text.trim());
    String nameValidate = Validator.nameValidate(nameController.text.trim());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: screenSize.width,
          padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 10, 40.0, 0),
          child: Column(
            children: [
              Headline(
                screenSize: screenSize,
                buttonTap: () {
                  print(confirmPasswordController.text);
                  print(passwordController.text);
                },
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
                buttonTap: () async {
                  if (emailValidate != null) {
                    Get.snackbar('Incorrect email or password', emailValidate, backgroundColor: Colors.red, colorText: Colors.white);
                  } else if (passwordValidate != null) {
                    Get.snackbar('Incorrect email or password', passwordValidate, backgroundColor: Colors.red, colorText: Colors.white);
                  } else if (nameValidate != null) {
                    Get.snackbar('Enter your name correctly', nameValidate, backgroundColor: Colors.red, colorText: Colors.white);
                  } else if (confirmPasswordController == null) {
                    Get.snackbar('Password do not match', 'Password do not match', backgroundColor: Colors.red, colorText: Colors.white);
                  } else if (confirmPasswordController.text != passwordController.text) {
                    Get.snackbar('Password do not match', 'Password do not match', backgroundColor: Colors.red, colorText: Colors.white);
                  } else {
                    String result = await AuthServices.signUpWithEmailandPassword(
                      emailController.text,
                      passwordController.text,
                      nameController.text,
                    );
                    if (result != 'berhasil') {
                      Get.snackbar(
                        'oops something went wrong',
                        result,
                        colorText: Colors.white,
                        backgroundColor: Colors.red,
                      );
                    }
                    Get.offAllNamed(HomePage.id);
                  }
                },
              ),
              SizedBox(height: screenSize.height / 7),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(LoginPage.id);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: 7.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: buttonBlueColor,
                          ),
                        ),
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
