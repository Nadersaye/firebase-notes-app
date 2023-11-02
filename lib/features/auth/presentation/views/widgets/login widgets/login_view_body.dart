import 'package:flutter/material.dart';
import 'custom_another_option_text.dart';
import 'custom_auth_button.dart';
import 'custom_login_form.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomLoginForm(),
          Container(height: 20),
          const CustomGoogleAuthButton(),
          CustomAnotherAuthOption(
            authMessage: "Don't Have An Account ? ",
            authOptionName: "Register",
            onTap: () {
              Navigator.of(context).pushReplacementNamed("signup");
            },
          )
        ],
      ),
    );
  }
}
