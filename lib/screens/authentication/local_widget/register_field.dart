import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/dark_button.dart';
import 'package:ngabolang/widgets/form_field_auth.dart';

class RegisterField extends StatelessWidget {
  const RegisterField({
    Key key,
    @required this.nameController,
    @required this.emailController,
    @required this.passwordController,
    @required this.confirmPasswordController,
    @required this.screenSize,
    @required this.buttonTap,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Size screenSize;
  final Function buttonTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 20.0,
      children: [
        Container(
          alignment: Alignment.center,
          child: Text('or register with email'),
        ),
        FormFieldAuth(
          text: 'Full name',
          fieldController: nameController,
          isPassword: false,
        ),
        FormFieldAuth(
          text: 'Your email',
          fieldController: emailController,
          isPassword: false,
        ),
        FormFieldAuth(
          text: 'Your password',
          fieldController: passwordController,
          isPassword: true,
        ),
        FormFieldAuth(
          text: 'Confirm Password',
          fieldController: confirmPasswordController,
          isPassword: true,
        ),
        DarkButton(
          screenSize: screenSize,
          buttonText: 'Create account',
          buttonTap: buttonTap,
        )
      ],
    );
  }
}
