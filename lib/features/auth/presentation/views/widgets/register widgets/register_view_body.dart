import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_button_auth.dart';
import 'custom_register_form.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRegisterForm(
            formKey: formKey,
            username: username,
            email: email,
            password: password),
        CustomButtonAuth(
            title: "SignUp",
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                await validateRegister(context);
              }
            }),
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed("login");
          },
          child: const Center(
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: "Have An Account ? ",
              ),
              TextSpan(
                  text: "Login",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold)),
            ])),
          ),
        )
      ],
    );
  }

  Future<void> validateRegister(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      Navigator.of(context).pushReplacementNamed('homePaage');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}




/*myauth.setConfig(
                          appEmail: "contact@hdevcoder.com",
                          appName: "Email OTP",
                          userEmail: email.text,
                          otpLength: 4,
                          otpType: OTPType.digitsOnly);
                      if (await myauth.sendOTP() == true) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("OTP has been sent"),
                        ));
                        Navigator.of(context).pushReplacementNamed('otpscreen',
                            arguments: myauth);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Oops, OTP send failed"),
                        ));
                      }*/