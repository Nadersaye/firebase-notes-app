import 'dart:io';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_training/features/auth/presentation/views/login_view.dart';
import 'package:firebase_training/features/auth/presentation/views/otp_email.dart';
import 'package:firebase_training/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'features/auth/presentation/views/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyBd8pXo0SZ0SO-ox_wNz471E7WAujq0p9w",
              appId: "1:335388615801:android:837c8215672db42ad620a8",
              messagingSenderId: "335388615801",
              projectId: "fir-training-828f4"))
      : await Firebase.initializeApp();
  runApp(const FirebaseTraining());
}

class FirebaseTraining extends StatefulWidget {
  const FirebaseTraining({super.key});

  @override
  State<FirebaseTraining> createState() => _FirebaseTrainingState();
}

class _FirebaseTrainingState extends State<FirebaseTraining> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        debugPrint('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser == null
          ? const LoginView()
          : const HomePage(),
      routes: {
        "signup": (context) => const SignUp(),
        "login": (context) => const LoginView(),
        "homepage": (context) => const HomePage(),
        "otpscreen": (context) => OtpScreen(
              myauth: ModalRoute.of(context)!.settings.arguments as EmailOTP,
            )
      },
    );
  }
}
