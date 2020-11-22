import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:ngabolang/screens/home/home_page.dart';
import 'package:ngabolang/services/field_validator.dart';
import 'package:ngabolang/services/firebase_auth.dart';
import 'package:ngabolang/widgets/headline.dart';

import 'local_widget/button_to_login.dart';
import 'local_widget/register_field.dart';
import 'upload_user_photo.dart';

class RegisterPage extends StatefulWidget {
  static final String id = 'register_page';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String emailValidate = Validator.emailValidate(emailController.text.trim());
    String passwordValidate = Validator.passwordValidate(passwordController.text.trim());
    String nameValidate = Validator.nameValidate(nameController.text.trim());

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: SingleChildScrollView(
          child: Container(
            width: screenSize.width,
            padding: EdgeInsets.fromLTRB(40.0, screenSize.height / 10, 40.0, 0),
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
                    } else {
                      Get.offAllNamed(HomePage.id);
                    }
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
                    setState(() {
                      isLoading = true;
                    });
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
                      setState(() {
                        isLoading = false;
                      });
                      if (result != 'berhasil') {
                        Get.snackbar(
                          'oops something went wrong',
                          result,
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                        );
                      } else {
                        Get.offAllNamed(UserPhoto.id);
                      }
                    }
                  },
                ),
                SizedBox(height: screenSize.height / 7),
                ButtonToLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
