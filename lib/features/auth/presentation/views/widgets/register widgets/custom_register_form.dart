import 'package:flutter/material.dart';

import '../custom_logo_auth.dart';
import '../custom_textformfield.dart';

class CustomRegisterForm extends StatelessWidget {
  const CustomRegisterForm({
    super.key,
    required this.formKey,
    required this.username,
    required this.email,
    required this.password,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController username;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 50),
            const CustomLogoAuth(),
            Container(height: 20),
            const Text("SignUp",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Container(height: 10),
            const Text("SignUp To Continue Using The App",
                style: TextStyle(color: Colors.grey)),
            Container(height: 20),
            const Text(
              "username",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Container(height: 10),
            CustomTextForm(
              hinttext: "ُEnter Your username",
              mycontroller: username,
              textFormFieldvalidator: (String? input) {
                if (input == null) {
                  return 'enter the username ';
                } else {
                  return null;
                }
              },
            ),
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
                if (input == null) {
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
          ],
        ),
      ),
    );
  }
}
