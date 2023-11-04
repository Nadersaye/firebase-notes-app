import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/reset password cubit/reset_password_cubit.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../custom_logo_auth.dart';
import '../../../../../../core/widgets/custom_textformfield.dart';
import '../custom_awesome_dialog.dart';
import 'custom_reset_password.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({
    super.key,
  });

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 50),
          const CustomLogoAuth(),
          Container(height: 20),
          const Text("Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          Container(height: 10),
          const Text("Login To Continue Using The App",
              style: TextStyle(color: Colors.grey)),
          Container(height: 20),
          const Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(height: 10),
          CustomTextForm(
            hinttext: "ُEnter Your Email",
            mycontroller: email,
            textFormFieldvalidator: (String? input) {
              if (input?.isEmpty ?? true) {
                return 'enter the email ';
              } else {
                return null;
              }
            },
          ),
          Container(height: 10),
          const Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Container(height: 10),
          CustomTextForm(
            hinttext: "ُEnter Your Password",
            mycontroller: password,
            textFormFieldvalidator: (String? input) {
              if (input?.isEmpty ?? true) {
                return 'enter the password ';
              } else {
                return null;
              }
            },
          ),
          CustomResetPassword(
            onTap: () async {
              BlocProvider.of<ResetPasswordCubit>(context).email = email.text;
              BlocProvider.of<ResetPasswordCubit>(context).resetPassword();
            },
          ),
          CustomButton(
              title: "login",
              onPressed: () async {
                await validateLogin(context);
              }),
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
        if (credential.user!.emailVerified) {
          Navigator.of(context).pushReplacementNamed("homepage");
        } else {
          customAwesomeDialog(
              context: context,
              titleText: 'Error',
              contentText:
                  'you must check your email inbox to verify your account',
              color: Colors.red);
        }
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
