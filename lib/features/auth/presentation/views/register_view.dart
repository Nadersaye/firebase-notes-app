import 'package:flutter/material.dart';

import 'widgets/register widgets/register_view_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: RegisterViewBody());
  }
}
