import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'widgets/home widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppbar(context),
      body: const HomeViewBody(),
    );
  }

  AppBar customHomeAppbar(BuildContext context) {
    return AppBar(
      title: const Text('Firebase install'),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("login", (route) => false);
            },
            icon: const Icon(Icons.exit_to_app))
      ],
    );
  }
}
