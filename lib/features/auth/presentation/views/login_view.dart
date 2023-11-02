import 'package:firebase_training/features/auth/presentation/views/widgets/login%20widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginViewBody());
  }
}
