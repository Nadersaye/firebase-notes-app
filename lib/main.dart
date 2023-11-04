import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_training/features/auth/presentation/views/login_view.dart';
import 'package:firebase_training/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/auth/presentation/manager/reset password cubit/reset_password_cubit.dart';
import 'features/auth/presentation/views/register_view.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return ResetPasswordCubit();
        }),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[50],
                titleTextStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
                iconTheme: const IconThemeData(color: Colors.orange))),
        home: FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified
            ? const HomeView()
            : const LoginView(),
        routes: {
          "signup": (context) => const RegisterView(),
          "login": (context) => const LoginView(),
          "homepage": (context) => const HomeView(),
        },
      ),
    );
  }
}
