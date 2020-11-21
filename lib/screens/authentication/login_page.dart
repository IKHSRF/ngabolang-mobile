import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/services/field_validator.dart';
import 'package:ngabolang/services/firebase_auth.dart';
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
    String emailValidate = Validator.emailValidate(emailController.text.trim());
    String passwordValidate = Validator.passwordValidate(passwordController.text.trim());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 10, 40.0, 0),
          width: screenSize.width,
          child: Column(
            children: [
              Headline(
                screenSize: screenSize,
                buttonTap: () async {
                  String result = await AuthServices.signInwitgGoogle();
                  if (result != 'berhasil') {
                    Get.snackbar(
                      'oops something went wrong',
                      result,
                      colorText: Colors.white,
                      backgroundColor: Colors.red,
                    );
                  }
                  Get.offAllNamed(HomePage.id);
                },
                textHeadline: 'Log In',
                buttonText: 'Login With Google',
              ),
              SizedBox(height: screenSize.height / 28),
              LoginField(
                screenSize: screenSize,
                emailController: emailController,
                passwordController: passwordController,
                buttonTap: () async {
                  //if the email and password is wrong, return snackbar with error
                  if (emailValidate != null && passwordValidate != null) {
                    Get.snackbar('Incorrect email or password', 'please fill in the fields correctly', backgroundColor: Colors.red, colorText: Colors.white);
                    //if the email is wrong, return snackbar with error
                  } else if (emailValidate != null) {
                    Get.snackbar('Incorrect email or password', emailValidate, backgroundColor: Colors.red, colorText: Colors.white);
                    //if the password is wrong, return snackbar with error
                  } else if (passwordValidate != null) {
                    Get.snackbar('Incorrect email or password', passwordValidate, backgroundColor: Colors.red, colorText: Colors.white);
                  }
                  //if the email and password is right, return snackbar with success
                  else {
                    String result = await AuthServices.loginWithEmailandPassword(emailController.text, passwordController.text);
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
