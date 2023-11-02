import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_button_auth.dart';
import 'custom_another_option_text.dart';
import 'custom_auth_button.dart';
import 'custom_awesome_dialog.dart';
import 'custom_login_form.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomLoginForm(
              autovalidateMode: autovalidateMode,
              formKey: formKey,
              email: email,
              password: password),
          CustomButtonAuth(
              title: "login",
              onPressed: () async {
                await validateLogin(context);
              }),
          Container(height: 20),
          const CustomAuthButton(),
          const CustomAnotherOptionText()
        ],
      ),
    );
  }

  Future<void> validateLogin(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
        Navigator.of(context).pushReplacementNamed("homepage");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          debugPrint('No user found for that email.');
          customAwesomeDialog(
              titleText: 'Error',
              context: context,
              contentText: 'No user found for that email.',
              color: Colors.red);
        } else if (e.code == 'wrong-password') {
          debugPrint('Wrong password provided for that user.');
          customAwesomeDialog(
              context: context,
              titleText: 'Wrong password',
              contentText: 'Wrong password provided for that user.',
              color: Colors.red);
        } else {
          customAwesomeDialog(
              context: context,
              titleText: 'Error',
              contentText: '$e',
              color: Colors.red);
        }
      }
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
