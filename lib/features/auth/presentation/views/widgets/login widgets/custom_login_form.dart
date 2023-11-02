import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_button_auth.dart';
import '../custom_logo_auth.dart';
import '../custom_textformfield.dart';
import 'custom_awesome_dialog.dart';

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
      child: Container(
        padding: const EdgeInsets.all(20),
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
                if (input == null) {
                  return 'enter the password ';
                } else {
                  return null;
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              alignment: Alignment.topRight,
              child: const Text(
                "Forgot Password ?",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            CustomButtonAuth(
                title: "login",
                onPressed: () async {
                  await validateLogin(context);
                }),
          ],
        ),
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
