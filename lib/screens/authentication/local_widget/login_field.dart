import 'package:flutter/material.dart';
import 'package:ngabolang/widgets/blue_button.dart';
import 'package:ngabolang/widgets/form_field_auth.dart';

class LoginField extends StatelessWidget {
  const LoginField({
    Key key,
    @required this.screenSize,
    @required this.emailController,
    @required this.passwordController,
    @required this.buttonTap,
  }) : super(key: key);

  final Size screenSize;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function buttonTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: screenSize.height / 27,
      children: [
        //text login with email
        Container(
          alignment: Alignment.center,
          child: Text(
            'or login with email',
            style: TextStyle(fontSize: 14),
          ),
        ),
        //textfield with controller, hint text and check is password field or not
        FormFieldAuth(
          text: 'Your Email',
          fieldController: emailController,
          isPassword: false,
        ),
        //textfield with controller, hint text and check is password field or not
        FormFieldAuth(
          text: 'Your password',
          fieldController: passwordController,
          isPassword: true,
        ),
        //forgot password button
        GestureDetector(
          onTap: () {},
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              'forgot password',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        //login button
        //screen size for screen size
        //button text  for text in button
        //button tap, function that run when user tap
        BlueButton(
          screenSize: screenSize,
          buttonTap: buttonTap,
          buttonText: 'Log in',
        ),
      ],
    );
  }
}
